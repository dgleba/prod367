

# In config/initializers/devise_ldap_db_override.rb  was local_override.rb

# https://github.com/cschiewek/devise_ldap_authenticatable/issues/24
# https://stackoverflow.com/questions/21595468/how-to-match-a-new-string-with-the-password-already-encrypted

# In config/initializers/devise.rb
# config.warden do |manager|
#     manager.default_strategies(:scope => :user).unshift :local_override


require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class DeviseLdapDbOverride < Authenticatable
      def valid?
        true
      end

      def authenticate!
        if params[:user]
          puts 'Devise. Entering devise_ldap_db_override for database auth. Devise.'
          user = User.find_by_email(params[:user][:email])
          
          # this no worky:
          # no: https://stackoverflow.com/questions/44778304/how-can-i-compare-decrypted-password-and-encrypted-password-by-bcrypt-gem
          #   if user && user.encrypted_password == params[:user][:password]
          #   if user && BCrypt::Password.new(user.encrypted_password) == params[:user][:password]
          #   if user && user.email == params[:user][:password]
          #   if user && BCrypt::Password.new(user.encrypted_password) == BCrypt::Password.new(params[:user][:password])

          if user && User.find_by_email(params[:user][:email]).valid_password?(params[:user][:password])
            success!(user)
          else
            fail
          end 
        else
          fail
        end 
      end 
    end 
  end 
end

Warden::Strategies.add(:devise_ldap_db_override, Devise::Strategies::DeviseLdapDbOverride)





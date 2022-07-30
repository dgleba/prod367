
# reset passwords..

# to run this at the prompt..
# http://stackoverflow.com/questions/10313181/pass-ruby-script-file-to-rails-console
#
# usage:    rails r passw.rb


u=User.where(:email => 'dmilnedb').first
u.password='dmilnedb'
u.password_confirmation='dmilnedb'
u.save!

u=User.where(:email => 'a@e').first
u.password='abc'
u.password_confirmation='abc'
u.save!

u=User.where(:email => 'a').first
u.password='abc'
u.password_confirmation='abc'
u.save!


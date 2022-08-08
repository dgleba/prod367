
# reset passwords..

# to run this at the prompt..
# http://stackoverflow.com/questions/10313181/pass-ruby-script-file-to-rails-console
#
# usage:    rails r passw.rb


u=User.where(:email => 'dgleba-db').first
u.password='abca'
u.password_confirmation='abcx'
u.save!

u=User.where(:email => 'dmilnedb').first
u.password='xxa'
u.password_confirmation='xx'
u.save!

u=User.where(:email => 'a@e').first
u.password='abc'
u.password_confirmation='abc'
u.save!

u=User.where(:email => 'a').first
u.password='abc'
u.password_confirmation='abc'
u.save!


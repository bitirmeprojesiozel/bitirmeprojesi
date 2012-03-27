class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.logged_in_timeout = AppConfig['session_timeout']['session_wait'].to_i.seconds
  end

  def role
    :user
  end

end

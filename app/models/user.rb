class User < ActiveRecord::Base
  attr_accessor :pw

  email_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :username,  :presence => true,
            :length               => { :maximum => 50}
  validates :email,     :presence => true,
            :format               => { :with => email_regex},
            :uniqueness           => { :case_sensitive => false}
  validates :pw,        :presence => true,
            :length               => { :within => 6..40}
  def has_password?(submitted_password)
    pw=submitted_password
  end
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

end

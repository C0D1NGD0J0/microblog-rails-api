class User < ApplicationRecord
	enum role: [:member, :editor, :admin]

	has_secure_password
	has_many :articles, dependent: :destroy

	validates_presence_of :email
	validates_uniqueness_of :email

	after_initialize do
	  if self.new_record? || self.role.nil?
	    self.role ||= :member
	  end
	end
end

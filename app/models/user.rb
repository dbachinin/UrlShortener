class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :links, dependent: :destroy
  #devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  # acts_as_messageable

  # def mailboxer_name
  #   self.email
  # end

  # def mailboxer_email(object)
  #   self.email
  # end

end

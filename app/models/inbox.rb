class Inbox < ApplicationRecord
	validates :shortmessage, presence: true
	validates :reseiver, presence: true
end

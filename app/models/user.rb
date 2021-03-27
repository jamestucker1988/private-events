class User < ApplicationRecord
	has_many :events, class_name: 'Event'

	validates :name, presence: true
	validates_uniqueness_of :name
end

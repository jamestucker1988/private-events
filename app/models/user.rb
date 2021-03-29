class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, class_name: 'Event'
  has_many :invitations, foreign_key: :attendee
  has_many :attended_events, through: :invitations

  validates :name, presence: true
  validates_uniqueness_of :name

  scope :past, -> { where(['date < ?', Date.today]) }
  scope :upcoming, -> { where(['date > ?', Date.today]) }
end

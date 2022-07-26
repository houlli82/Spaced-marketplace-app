class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :from, presence: true
  validates :to, presence: true

  def pending?
    status == 'pending'
  end
end

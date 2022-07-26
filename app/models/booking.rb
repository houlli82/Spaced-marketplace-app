class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :from, presence: true
  validates :to, presence: true

  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if from < Date.today
      errors.add(:from, "can't be a past date.")
    elsif to < Date.today
      errors.add(:to, "can't be a past date.")
    end
  end
end

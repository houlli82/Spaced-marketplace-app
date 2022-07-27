class Space < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  include PgSearch::Model
    multisearchable against: [:title, :location]

      pg_search_scope :search_by_title_and_location,
        against: [ :title, :location ],
        using: {
          tsearch: { prefix: true }
        }
end

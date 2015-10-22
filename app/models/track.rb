class Track < ActiveRecord::Base
  validates :title, :track_type, :album_id, presence: true
  validates :track_type, includes: %w( Regular Bonus )

  belongs_to :album


end

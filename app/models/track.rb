class Track < ActiveRecord::Base
  validates :title, :track_type, :album_id, presence: true
  validates :track_type, inclusion: { in: %w( Regular Bonus ) }

  belongs_to(
    :album,
    class_name: "Album",
    foreign_key: :album_id
  )


end

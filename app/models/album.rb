class Album < ActiveRecord::Base

  validates :title, :rtype, :band_id, presence: true
  validates :rtype, inclusion: { in: %w( Live Studio ) }

  belongs_to(
    :band,
    class_name: "Band",
    foreign_key: :band_id
  )
  has_many(
    :tracks,
    class_name: "Track",
    foreign_key: :album_id,
    dependent: :destroy
  )



end

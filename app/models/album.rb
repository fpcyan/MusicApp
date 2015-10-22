class Album < ActiveRecord::Base

  validates, :title, :rtype, :band_id, presence: true
  validates :rtype, includes: %w( Live Studio )

  belongs_to :band
  has_many :tracks



end

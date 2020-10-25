class VideoView < ApplicationRecord
  belongs_to :video

  validates :view_number, presence: true
end

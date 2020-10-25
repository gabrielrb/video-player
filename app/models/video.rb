class Video < ApplicationRecord
  belongs_to :user
  has_one :video_view, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :url, presence: true,
                  format: { with: /\A.*(\.m3u8)\z/, message: "url must end with '.m3u8'" }

end

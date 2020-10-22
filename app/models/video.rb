class Video < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :url, presence: true,
                  format: { with: /\A.*(\.m3u8)\z/, message: "url must end with '.m3u8'" }

end

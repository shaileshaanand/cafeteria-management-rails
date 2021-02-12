class MenuItem < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :menu
  validates :name, presence: true
  validates :price, presence: true
  # validates :image, presence: true
  has_one_attached :picture

  def get_image_url
    url_for(self.image)
  end
end

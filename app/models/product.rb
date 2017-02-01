class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: {minimum: 5}
  has_attached_file :image, styles: { large: "900x300>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/default.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

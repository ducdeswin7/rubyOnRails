class Category < ApplicationRecord
  begin
    has_many :products

    validates :title, :description, presence: true
  end
end

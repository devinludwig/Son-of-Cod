class Product < ApplicationRecord
  has_many :reviews
  validates :name, :price, presence: true
end

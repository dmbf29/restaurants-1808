class Restaurant < ApplicationRecord
  # associations
  has_many :reviews, dependent: :destroy # this will destroy the reviews of this restaurant
  # validations
  validates :name, presence: true
  validates :address, presence: true
end

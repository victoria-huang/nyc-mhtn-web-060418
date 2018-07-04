class Farmer < ApplicationRecord
  has_many :cows, dependent: :delete_all
  accepts_nested_attributes_for :cows

  validates :name, presence: true
end

class Category < ApplicationRecord
  has_many :user_categories, dependent: :destroy
  has_many :users, through: :user_categories
  has_many :newspaper_categories, dependent: :destroy
  has_many :newspapers, through: :newspaper_categories
end

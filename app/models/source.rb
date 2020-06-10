class Source < ApplicationRecord
  has_many :user_sources, dependent: :destroy
  has_many :users, through: :user_sources
  has_many :newspaper_sources, dependent: :destroy
  has_many :newspapers, through: :newspaper_sources
end

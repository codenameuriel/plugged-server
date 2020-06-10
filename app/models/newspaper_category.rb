class NewspaperCategory < ApplicationRecord
  belongs_to :newspaper
  belongs_to :category
end

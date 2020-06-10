class NewspaperSource < ApplicationRecord
  belongs_to :newspaper
  belongs_to :source
end

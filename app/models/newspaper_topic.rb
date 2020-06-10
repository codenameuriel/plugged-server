class NewspaperTopic < ApplicationRecord
  belongs_to :newspaper
  belongs_to :topic
end

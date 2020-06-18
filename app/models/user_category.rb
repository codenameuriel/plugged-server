class UserCategory < ApplicationRecord
  belongs_to :user
  belongs_to :category

  def get_newspapers
    newspapers = self.user.newspapers.map do |n|
      {
        title: n.title,
        sources: n.newspaper_sources.map do |ns|
          ns.source
        end,
        categories: n.newspaper_categories.map do |nc|
          nc.category
        end,
        topics: n.newspaper_topics.map do |nt|
          nt.topic
        end,
        created_at: n.created_at
      }
    end

    return newspapers
  end
end

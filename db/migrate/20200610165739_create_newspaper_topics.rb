class CreateNewspaperTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :newspaper_topics do |t|
      t.integer :newspaper_id
      t.integer :topic_id

      t.timestamps
    end
  end
end

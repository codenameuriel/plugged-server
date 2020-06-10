class CreateNewspaperSources < ActiveRecord::Migration[6.0]
  def change
    create_table :newspaper_sources do |t|
      t.integer :newspaper_id
      t.integer :source_id

      t.timestamps
    end
  end
end

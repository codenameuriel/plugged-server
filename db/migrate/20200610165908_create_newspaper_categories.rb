class CreateNewspaperCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :newspaper_categories do |t|
      t.integer :newspaper_id
      t.integer :category_id

      t.timestamps
    end
  end
end

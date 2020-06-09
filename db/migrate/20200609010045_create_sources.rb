class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :country
      t.string :language

      t.timestamps
    end
  end
end

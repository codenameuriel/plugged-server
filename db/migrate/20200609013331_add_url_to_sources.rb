class AddUrlToSources < ActiveRecord::Migration[6.0]
  def change
    add_column :sources, :url, :string
  end
end

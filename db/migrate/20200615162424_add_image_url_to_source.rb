class AddImageUrlToSource < ActiveRecord::Migration[6.0]
  def change
    add_column :sources, :image_url, :string
  end
end

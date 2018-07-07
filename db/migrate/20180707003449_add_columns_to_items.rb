class AddColumnsToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :address, :string
    add_column :items, :url, :string
    add_column :items, :hours, :string
    add_column :items, :duration, :string
    add_column :items, :cost, :string
    add_column :items, :tags, :string
    add_column :items, :notes, :string
  end
end

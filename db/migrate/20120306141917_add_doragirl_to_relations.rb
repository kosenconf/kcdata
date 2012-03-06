class AddDoragirlToRelations < ActiveRecord::Migration
  def change
    add_column :relations, :doragirl, :boolean, :default => false
  end
end

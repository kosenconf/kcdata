class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.boolean :attendee, :default => false
      t.boolean :staff,    :default => false
      t.boolean :speaker,  :default => false
      t.boolean :online,   :default => false
      t.integer :user_id,  :null => false
      t.integer :event_id, :null => false

      t.timestamps
    end

    add_index :relations, :user_id
    add_index :relations, :event_id
    add_index :relations, [:user_id, :event_id], :unique => true
  end
end

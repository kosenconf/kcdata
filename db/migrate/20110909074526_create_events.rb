class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   :serial,      :null => false
      t.string   :name,        :null => false
      t.string   :description
      t.string   :url
      t.integer  :turnout,     :default => 0
      t.string   :place
      t.string   :address
      t.datetime :date

      t.timestamps
    end

    add_index :events, :serial, :unique => true
  end
end

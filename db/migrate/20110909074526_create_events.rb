class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :serial
      t.string :name
      t.integer :turnout
      t.string :place
      t.string :address
      t.datetime :date

      t.timestamps
    end
  end
end

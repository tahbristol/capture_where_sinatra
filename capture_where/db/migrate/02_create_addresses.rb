class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :location
      t.string :note

      t.timestamps null: false
    end
  end
end
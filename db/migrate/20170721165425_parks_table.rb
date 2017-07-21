class ParksTable < ActiveRecord::Migration[5.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :state
      t.text :mailingaddress
      t.string :phone
      t.text :description
      t.integer :fee
      t.string :open_through
      t.string :closure
      t.string :amenities
      t.string :activities
      t.integer :sq_mi

      t.timestamps
    end
  end
end

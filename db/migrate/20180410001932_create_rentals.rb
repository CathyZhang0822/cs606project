class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.timestamp :pickUpTime, null: true
      t.timestamp :expectedReturnTime, null: false
      t.timestamp :returnTime, null: true
      t.string :status, default:"Available"
      
      t.references :user
      t.references :suit
      t.timestamps
    end
  end
end

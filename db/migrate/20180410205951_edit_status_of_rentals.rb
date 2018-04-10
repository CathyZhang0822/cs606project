class EditStatusOfRentals < ActiveRecord::Migration
  def change
    change_column :rentals, :status, :string, default:"Active"
  end
end

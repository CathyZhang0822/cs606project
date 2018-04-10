class AddSuitstatusToSuit < ActiveRecord::Migration
  def change
    add_column :suits, :suitStatus, :string, default:"Available"
  end
end

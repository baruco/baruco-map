class AddZip < ActiveRecord::Migration
  def change
    add_column :tickets, :zip, :string
  end
end

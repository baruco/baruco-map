class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :identifier
      t.string :street
      t.string :city
      t.string :country
      t.float :longitude
      t.float :latitude
    end
  end
end

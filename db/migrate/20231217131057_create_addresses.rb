  class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
  
      t.timestamps
    end
    add_reference :addresses, :user, foreign_key: true
  end
end

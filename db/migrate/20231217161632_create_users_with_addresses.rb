class CreateUsersWithAddresses < ActiveRecord::Migration[7.0]
  def change
    create_view :users_with_addresses
  end
end

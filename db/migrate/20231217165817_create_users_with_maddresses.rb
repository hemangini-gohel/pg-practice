class CreateUsersWithMaddresses < ActiveRecord::Migration[7.0]
  def change
    create_view :users_with_maddresses
  end
end

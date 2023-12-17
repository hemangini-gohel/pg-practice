# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggerProductsDelete < ActiveRecord::Migration[7.0]
  def up
    create_trigger("products_after_delete_row_tr", :generated => true, :compatibility => 1).
        on("products").
        after(:delete) do
      "INSERT INTO removed_products (name, created_at, updated_at) VALUES (OLD.name, OLD.created_at, OLD.updated_at);"
    end
  end

  def down
    drop_trigger("products_after_delete_row_tr", "products", :generated => true)
  end
end

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :firstname, null: false # not null constraint
      t.string :lastname
      t.integer :age, default: 0 # default constraint
      t.string :email, null: false

      t.index :email, unique: true # unique constraint
      t.timestamps
    end
    add_check_constraint 'users', 'age > 0', name: 'age_check' # check constraint
  end
end

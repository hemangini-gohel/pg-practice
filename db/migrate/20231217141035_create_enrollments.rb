class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.belongs_to :student, index: true
      t.belongs_to :course, index: true

      t.integer :enrollment_number
      t.timestamps
    end
  end
end

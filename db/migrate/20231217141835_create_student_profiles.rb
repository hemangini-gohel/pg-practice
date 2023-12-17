class CreateStudentProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :student_profiles do |t|
      t.string :full_name
      t.text :bio

      t.references :student, foreign_key: true, unique: true

      t.timestamps
    end
    
  end
end

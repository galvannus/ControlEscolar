class CreateStudentsubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :studentsubjects do |t|
      t.references :subject, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end

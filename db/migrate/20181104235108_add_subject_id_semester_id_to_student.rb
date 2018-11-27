class AddSubjectIdSemesterIdToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :subject_id, :integer
    add_column :students, :semester_id, :integer

    add_foreign_key :subject, :students
    add_foreign_key :semester, :students

    add_index :students, :subject_id
    add_index :students, :semester_id
  end
end

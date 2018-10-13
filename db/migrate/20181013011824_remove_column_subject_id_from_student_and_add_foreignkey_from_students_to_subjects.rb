class RemoveColumnSubjectIdFromStudentAndAddForeignkeyFromStudentsToSubjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :subject_id
    add_foreign_key :subjects, :students
    add_index :subjects, :student_id
  end
end

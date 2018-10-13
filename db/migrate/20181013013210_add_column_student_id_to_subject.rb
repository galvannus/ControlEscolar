class AddColumnStudentIdToSubject < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :student_id, :integer
    add_foreign_key :subjects, :students
    add_column :students, :account_id, :integer
    add_foreign_key :accounts, :students
    add_index :students, :account_id
  end
end

class AddForeignKeandIndextoStudentId < ActiveRecord::Migration[5.1]
  def change
    add_index :accounts, :student_id
    remove_column :students, :account_id
  end
end

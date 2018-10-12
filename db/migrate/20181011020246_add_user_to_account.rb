class AddUserToAccount < ActiveRecord::Migration[5.1]
  def change
    tadd_column :accounts, :student_id, :integer
    remove_column :students, :account

    
  end
end

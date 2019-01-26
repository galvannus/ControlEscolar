class AddAverageToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :average, :decimal
    #add_column :studentsubjects, :user_id, :integer

    add_reference :studentsubjects, :user, index: true

  end
end

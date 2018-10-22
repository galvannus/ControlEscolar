class AddColumToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :discount, :integer
  end
end

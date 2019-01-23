class ChangeRecordpayment < ActiveRecord::Migration[5.1]
  def change
    rename_column :recordpayments, :user_id, :user_name
    change_column :recordpayments, :user_name, :string
  end
end

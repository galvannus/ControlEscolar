class CreateRecordpayments < ActiveRecord::Migration[5.1]
  def change
    create_table :recordpayments do |t|
      t.references :user, foreign_key: true
      t.decimal :amount
      t.references :debt, foreign_key: true

      t.timestamps
    end
  end
end

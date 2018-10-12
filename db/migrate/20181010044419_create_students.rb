class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.references :group, foreign_key: true, index:true
      t.references :subject, foreign_key: true, index:true
      t.string :name
      t.string :lastname
      t.string :tel1
      t.string :tel2
      t.string :street
      t.string :numberhome
      t.string :suburb
      t.string :registrationnumber
      t.string :banknumber
      t.references :account, foreign_key: true, index:true

      t.timestamps
    end
  end
end

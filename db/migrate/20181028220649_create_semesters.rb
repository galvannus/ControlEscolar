class CreateSemesters < ActiveRecord::Migration[5.1]
  def change
    create_table :semesters do |t|
      t.integer :number_semester

      t.timestamps
    end
  end
end

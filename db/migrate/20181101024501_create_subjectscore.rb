class CreateSubjectscore < ActiveRecord::Migration[5.1]
  def change
    create_table :subjectscores do |t|
      t.references :student, foreign_key: true, index: true
      t.references :subject, foreign_key: true, index: true
      t.references :partial, foreign_key: true, index: true
      t.references :score, foreign_key: true, index: true
      
      t.timestamps
    end
  end
end

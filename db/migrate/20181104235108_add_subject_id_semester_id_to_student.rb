class AddSubjectIdSemesterIdToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :subject_id, :integer
    add_column :students, :semester_id, :integer

    add_foreign_key :subject, :students
    add_foreign_key :semester, :students

    add_index :students, :subject_id
    add_index :students, :semester_id

    add_column :subjectscores, :firstscore, :decimal
    add_column :subjectscores, :secondscore, :decimal

    #Add to score
    add_column :scores, :subject_id, :integer
    add_column :scores, :student_id, :integer

    add_foreign_key :subject, :scores
    add_foreign_key :student, :scores
    add_index :scores, :subject_id
    add_index :scores, :student_id

    #Add to subject
    add_foreign_key :student, :subjects
    add_index :subjects, :student_id


  end
end

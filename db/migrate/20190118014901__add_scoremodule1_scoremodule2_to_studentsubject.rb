class AddScoremodule1Scoremodule2ToStudentsubject < ActiveRecord::Migration[5.1]
  def change
    add_column :studentsubjects, :firstsmodulescore, :decimal
    add_column :studentsubjects, :secondmodulescore, :decimal
  end
end

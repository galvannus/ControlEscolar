class Subject < ApplicationRecord
    has_many :students, through: :studentsubjects
    has_many :studentsubjects
    #has_many :students, through: :subjectscores
    has_many :subjectscores
end

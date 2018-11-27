class Subjectscore < ApplicationRecord
    belongs_to :student
    belongs_to :subject
    belongs_to :partial
    belongs_to :score
end
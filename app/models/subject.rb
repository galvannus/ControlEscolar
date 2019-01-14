class Subject < ApplicationRecord
    has_many :students, through: :studentsubjects
    has_many :studentsubjects
end

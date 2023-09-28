class Answer < ApplicationRecord
  belongs_to :student, foreign_key: 'student_id'
  belongs_to :question, foreign_key: 'question_id'
end


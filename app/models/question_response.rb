# == Schema Information
#
# Table name: question_responses
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  question_choice_id :integer
#  response_id        :integer
#
# Indexes
#
#  index_question_responses_on_question_choice_id  (question_choice_id)
#  index_question_responses_on_response_id         (response_id)
#

class QuestionResponse < ApplicationRecord
  belongs_to :question_choice
  belongs_to :response

  validates :question_choice, presence: true
  validates :response, presence: true

  delegate :question, :creative_quality, to: :question_choice
end

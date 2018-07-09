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

require 'rails_helper'

describe QuestionResponse do
  context 'associations' do
    it { is_expected.to belong_to(:question_choice) }
    it { is_expected.to belong_to(:response) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :question_choice }
    it { is_expected.to validate_presence_of :response }
  end
end

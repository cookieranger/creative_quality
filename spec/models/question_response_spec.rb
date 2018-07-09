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

  context 'score_by_quality_name' do
    let(:creative_quality_1) { build(:creative_quality, name: 'cq1') }
    let(:creative_quality_2) { build(:creative_quality, name: 'cq2') }
    let(:question_choice) {
      create(
        :question_choice,
        creative_quality: creative_quality_1,
        score: 9
      )
    }
    let!(:question_response) {
      create(:question_response, question_choice: question_choice )
    }

    it 'gets the max score of all possible choices' do
    #   binding.pry
      expect(question_response.score_by_quality_name(creative_quality_1.name)).to eq 9
      expect(question_response.score_by_quality_name(creative_quality_2.name)).to eq 0
    end
  end
end

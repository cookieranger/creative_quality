# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  position   :integer
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Question do
  context 'associations' do
    it { is_expected.to have_many(:question_choices) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :title }
  end

  context 'total_max_score' do
    let(:creative_quality_1) { build(:creative_quality, name: 'cq1') }
    let(:creative_quality_2) { build(:creative_quality, name: 'cq2') }
    let!(:question) {
      create(:question, question_choices: [
        build(:question_choice, creative_quality: creative_quality_1, score: 1),
        build(:question_choice, creative_quality: creative_quality_2, score: 5),
        build(:question_choice, creative_quality: creative_quality_1, score: 3)
      ])
    }
    it 'gets the max score of all possible choices' do
      expect(question.max_score(creative_quality_1.name)).to eq 3
      expect(question.max_score(creative_quality_2.name)).to eq 5
    end
  end
end

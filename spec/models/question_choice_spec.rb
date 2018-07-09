# == Schema Information
#
# Table name: question_choices
#
#  id                  :integer          not null, primary key
#  score               :integer
#  text                :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  creative_quality_id :integer
#  question_id         :integer
#
# Indexes
#
#  index_question_choices_on_creative_quality_id  (creative_quality_id)
#  index_question_choices_on_question_id          (question_id)
#

require 'rails_helper'

describe QuestionChoice do
  context 'associations' do
    it { is_expected.to belong_to(:question) }
    it { is_expected.to belong_to(:creative_quality) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :text }
    it { is_expected.to validate_presence_of :question }
    it { is_expected.to validate_presence_of :creative_quality }
    it { is_expected.to validate_numericality_of :score }
  end
end

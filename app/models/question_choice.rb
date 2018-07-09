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

class QuestionChoice < ApplicationRecord
  belongs_to :question, inverse_of: :question_choices
  belongs_to :creative_quality

  validates :text, :question, :creative_quality, presence: true
  validates :score, numericality: { only_integer: true }

  def creative_quality_name
    @creative_quality_name ||= creative_quality.name
  end
end

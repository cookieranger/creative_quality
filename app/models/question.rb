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

class Question < ApplicationRecord
  has_many :question_choices, inverse_of: :question

  validates :title, presence: true

  accepts_nested_attributes_for(:question_choices)

  def max_score(quality_name)
    question_choices
      .with_quality_name(quality_name)
      .max_by(&:score).try(:score) || 0
  end
end

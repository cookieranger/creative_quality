# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ApplicationRecord
  has_many :question_responses

  validates :first_name, presence: true
  validates :last_name, presence: true

  delegate :count, to: :question_responses, prefix: true

  def display_name
    "#{first_name} #{last_name}"
  end

  def completed?
    question_responses_count == Question.count
  end

  def total_raw_score(quality_name)
    question_responses.sum do |q_res|
      q_res.score_by_quality_name(quality_name)
    end
  end

  def total_max_score(quality_name)
    question_responses.sum do |q_res|
      q_res.question.max_score(quality_name)
    end
  end
end

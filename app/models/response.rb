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
end

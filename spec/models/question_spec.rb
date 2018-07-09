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
end

# == Schema Information
#
# Table name: creative_qualities
#
#  id          :integer          not null, primary key
#  color       :string
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CreativeQuality < ApplicationRecord
  has_many :question_choices

  validates :name, :description, :color, presence: true
end

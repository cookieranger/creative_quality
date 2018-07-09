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

  # NOTE: unused
  def self.all_names
    all.map(&:name).uniq
  end

  def final_score
    calculated = (total_raw_for_quality.to_f / total_max_for_quality) * 100
    clamp(calculated.to_i, -100, 100)
  end

  def total_raw_for_quality
    Response.all.sum do |res|
      res.total_raw_score(name)
    end
  end

  def total_max_for_quality
    Response.all.sum do |res|
      res.total_max_score(name)
    end
  end

  private
  def clamp(num, min, max)
    return min if num < min
    return max if num > max
    num
  end
end

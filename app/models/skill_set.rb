class SkillSet < ActiveRecord::Base
  belongs_to :user
  belongs_to :created_by, class_name: 'User'
  has_many :items, ->(record){ order(number: :asc) }, class_name: 'SkillSetItem'
  has_many :skills, through: :items
end

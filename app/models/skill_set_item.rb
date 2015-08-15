class SkillSetItem < ActiveRecord::Base
  belongs_to :skill_set
  belongs_to :skill
end

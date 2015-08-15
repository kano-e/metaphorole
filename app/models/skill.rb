class Skill < ActiveRecord::Base
  has_many :skill_set_items
end

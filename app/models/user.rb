class User < ActiveRecord::Base
  has_many :skill_sets
  has_many :gave_skill_sets
end

class Ability < ActiveRecord::Base
  belongs_to :user

  scope :newer, -> { order(id: :desc) }
end

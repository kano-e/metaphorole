class SkillSet < ActiveRecord::Base
  belongs_to :user
  belongs_to :created_by, class_name: 'User'
  has_many :items, class_name: 'SkillSetItem'
  has_many :skills, through: :items

  before_save :evaluate_ability
  after_save :call_evaluate_ability_for_user

  scope :mine, -> { where(user_id: arel_table[:created_by_id]) }
  scope :given, -> { where.not(user_id: arel_table[:created_by_id]) }
  scope :newer, -> { order(id: :desc) }

  def evaluate_ability
    ability_names = %w(attack_point defence_point heal_point enchant_point)
    columns = ability_names.map{|name| Skill.arel_table[name].sum.as(name) }
    result = Skill.select(columns).where(id: skills.map(&:id)).take
    return true unless result

    abilities = result.attributes.slice(*ability_names)
    max_value = BigDecimal(abilities.values.max.to_i)
    abilities.each do |ability, value|
      if value.blank? || value.zero? || max_value.zero?
        self[ability] = 0
      else
        self[ability] = (BigDecimal(value * 100) / max_value).to_i
      end
    end
    true
  end

  private

  def call_evaluate_ability_for_user
    user.evaluate_ability if user
  end
end

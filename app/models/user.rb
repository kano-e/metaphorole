# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#

class User < ActiveRecord::Base
  has_many :skill_sets
  has_many :my_skill_sets, -> { mine }, class_name: 'SkillSet'
  has_many :gave_skill_sets, -> { given }, class_name: 'SkillSet'
  has_many :abilities
  has_one :current_ability, -> { newer }, class_name: 'Ability'

  # あるユーザに対するスキル評価
  #
  # @param [User] target スキル評価対象ユーザ
  # @param [Array<Skill>] skills 評価したスキル一覧
  # @return [void]
  def give(target, skills)
    SkillSet.create(
      user: target,
      skills: skills,
    )
  end

  # 能力値の集計を行う
  def evaluate_ability
    ability_names = %w(attack_point defence_point heal_point enchant_point)
    abilitie_values = ability_names.each_with_object({}){|n, a| a[n] = 0 }
    counter = 0
    skill_sets.newer.find_each do |skill_set|
      # @todo 期間は後でなんとかする
      break if counter >= 100 || skill_set.created_at.since(1.year).past?

      ability_names.each do |name|
        abilitie_values[name] += skill_set[name]
      end
      counter += 1
    end

    max_value = BigDecimal(abilitie_values.values.max.to_i)

    ability = abilities.build
    abilitie_values.each do |name, value|
      if value.blank? || value.zero? || max_value.zero?
        ability[name] = 0
      else
        ability[name] = (BigDecimal(value * 100) / max_value).to_i
      end
    end

    ability.save
  end
end

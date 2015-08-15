class CreateSkillSets < ActiveRecord::Migration
  def change
    create_table :skill_sets do |t|
      t.timestamps null: false
      t.references :user, index: true, foreign_key: true
      t.references :created_by, index: true
      t.integer :attack_point, null: false, default: 0
      t.integer :defence_point, null: false, default: 0
      t.integer :heal_point, null: false, default: 0
      t.integer :enchant_point, null: false, default: 0
    end
  end
end

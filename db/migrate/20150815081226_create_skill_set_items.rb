class CreateSkillSetItems < ActiveRecord::Migration
  def change
    create_table :skill_set_items do |t|
      t.references :skill_set, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true
      t.integer :number
      t.timestamps null: false
    end
  end
end

class CreateSkillSets < ActiveRecord::Migration
  def change
    create_table :skill_sets do |t|
      t.references :user, index: true, foreign_key: true
      t.references :created_by, index: true
      t.timestamps null: false
    end
  end
end

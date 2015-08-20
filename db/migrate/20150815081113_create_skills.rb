class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.timestamps null: false
      t.string :label, null: false
      t.integer :attack_point, null: false, default: 0
      t.integer :defence_point, null: false, default: 0
      t.integer :heal_point, null: false, default: 0
      t.integer :enchant_point, null: false, default: 0
    end
  end
end

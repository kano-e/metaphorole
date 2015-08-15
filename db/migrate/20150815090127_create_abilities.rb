class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.timestamps null: false
      t.references :user, index: true, foreign_key: true
      t.integer :attack_point, null: false, default: 0
      t.integer :defence_point, null: false, default: 0
      t.integer :heal_point, null: false, default: 0
      t.integer :enchant_point, null: false, default: 0
    end
  end
end

class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :attack
      t.integer :defence
      t.integer :heal
      t.integer :enchant

      t.timestamps null: false
    end
  end
end

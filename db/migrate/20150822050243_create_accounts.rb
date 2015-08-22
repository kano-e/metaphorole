class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.timestamps null: false
      t.references :user, null: false, foreign_key: true
      t.string :provider, null: false
      t.string :uid, null: false
      t.text :token
      t.text :secret
      t.string :nickname
      t.string :name
      t.text :image_url
      t.text :profile_url
    end

    add_index :accounts, [:user_id, :provider], unique: true
    add_index :accounts, [:provider, :uid], unique: true
  end
end

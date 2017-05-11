class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :nickname
      t.string :email
      t.string :name
      t.string :image
      t.string :token

      t.timestamps
    end
  end
end

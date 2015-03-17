class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, default: ''
      t.string :email, null: false
      t.string :password, null: false
      t.boolean :admin, default: false
      t.datetime :last_signed_in_at, null: false, default: Time.now

      t.timestamps null: false
    end
  end
end

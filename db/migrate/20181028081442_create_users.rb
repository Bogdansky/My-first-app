class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :status, default: "active"
      t.date :date_create
      t.date :last_login

      t.timestamps null: false
    end
  end
end

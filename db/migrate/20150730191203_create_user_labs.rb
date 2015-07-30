class CreateUserLabs < ActiveRecord::Migration
  def change
    create_table :user_labs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :lab, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.string :name
      t.string :college

      t.timestamps null: false
    end
  end
end

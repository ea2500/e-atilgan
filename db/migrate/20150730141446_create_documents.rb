class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :doc_file

      t.timestamps null: false
    end
  end
end

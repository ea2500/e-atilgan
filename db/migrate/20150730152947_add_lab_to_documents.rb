class AddLabToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :lab, index: true, foreign_key: true
  end
end

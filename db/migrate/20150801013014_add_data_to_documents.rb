class AddDataToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :data, :binary
  end
end

class AddFilenameToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :filename, :string
    add_column :documents, :content_type, :string
  end
end

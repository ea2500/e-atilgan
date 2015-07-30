class ChangeColumnNameInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :image_url, :remote_image_url
  end
end

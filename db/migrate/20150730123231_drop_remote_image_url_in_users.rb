class DropRemoteImageUrlInUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :remote_image_url
  end
end

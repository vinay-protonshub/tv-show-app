class RemoveDeviceFromChannels < ActiveRecord::Migration[5.2]
  def change
    remove_column :channels, :device
    remove_column :shows, :status
    remove_column :shows, :fav
    remove_column :users, :admin
    add_column :station_shows, :fav, :boolean, default: false
  end
end

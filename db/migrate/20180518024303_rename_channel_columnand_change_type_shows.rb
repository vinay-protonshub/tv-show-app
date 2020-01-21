class RenameChannelColumnandChangeTypeShows < ActiveRecord::Migration[5.2]
  def change
    rename_column :shows, :channel, :channel_id
    change_column :shows, :channel_id, :integer
    change_column :station_shows, :user_season, :integer
    remove_column :shows, :genre
  end
end

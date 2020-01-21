class RenameStationShowsToListings < ActiveRecord::Migration[5.2]
  def change
    rename_table :station_shows, :listings
  end
end

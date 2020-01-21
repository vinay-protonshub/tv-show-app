class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :title
      t.text :description
      t.string :genre
      t.string :channel
      t.string :status
      t.string :day
      t.string :time
      t.integer :current_season
      t.boolean :fav, default: false

      t.timestamps
    end
  end
end

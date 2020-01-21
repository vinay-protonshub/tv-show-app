class AddCreatedByToShows < ActiveRecord::Migration[5.2]
  def change
    add_column :shows, :created_by, :integer
  end
end

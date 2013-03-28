class AddAgainChangeDefaultValueToIsStarAndIsToRead < ActiveRecord::Migration
  def change
  	  	change_column :feed_entries, :is_star, :boolean, :default => false
  	change_column :feed_entries, :is_to_read, :boolean, :default => false
  end
end

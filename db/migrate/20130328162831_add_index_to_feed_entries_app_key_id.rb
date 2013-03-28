class AddIndexToFeedEntriesAppKeyId < ActiveRecord::Migration
  def change
  	add_index :feed_entries, [:app_key_id, :created_at]
  	add_index :feed_entries, [:is_star, :created_at]
  	add_index :feed_entries, [:is_to_read, :created_at]
  end
end

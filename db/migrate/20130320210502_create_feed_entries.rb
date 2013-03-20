class CreateFeedEntries < ActiveRecord::Migration
  def change
    create_table :feed_entries do |t|
      t.integer :app_key_id
      t.string :name
      t.text :summary
      t.string :url
      t.datetime :published_at
      t.string :guid
      t.boolean :is_star
      t.boolean :is_to_read
      t.datetime :last_clicked_on

      t.timestamps
    end
  end
end

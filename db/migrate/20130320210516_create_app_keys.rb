class CreateAppKeys < ActiveRecord::Migration
  def change
    create_table :app_keys do |t|
      t.string :app
      t.text :app_url
      t.string :entity_name
      t.datetime :last_processed
      t.string :is_pending
      t.datetime :last_requested_processing

      t.timestamps
    end
  end
end

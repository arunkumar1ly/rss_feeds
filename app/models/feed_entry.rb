 class FeedEntry < ActiveRecord::Base
  attr_accessible :name, :summary, :url, :published_at, :guid, :is_to_read, :app_key_id, :is_star
  #validates :app_key_id, presence: true
  belongs_to :app_key

  default_scope order: 'feed_entries.created_at DESC'

  def self.get_feeds(delay_interval = 3.minutes)
    feed_url = [FeedEntry.where("is_pending = ?", "pending")]
    update_from_feed(feed_url)
  end

  def self.update_from_feed(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries)
  end
  
  def self.update_from_feed_continuously(feed_url, delay_interval = 15.minutes)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries)
    loop do
      sleep delay_interval
      feed = Feedzirra::Feed.update(feed)
      add_entries(feed.new_entries) if feed.updated?
    end
  end

  private

  def self.add_entries(entries)
    entries.each do |entry|
      unless exists? guid: entry.id
        create!(
          name: entry.title,
          summary: entry.summary,
          url: entry.url,
          published_at: entry.published,
          guid: entry.id
        )
      end
    end
  end

end
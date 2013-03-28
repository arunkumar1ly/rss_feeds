 class FeedEntry < ActiveRecord::Base
  attr_accessible :name, :summary, :url, :published_at, :guid, :is_to_read, :app_key_id, :is_star
  validates :app_key_id, presence: true
  belongs_to :app_key

  default_scope order: 'feed_entries.created_at DESC'

  def self.get_feeds#(delay_interval = 3.minutes)
    #loop do
    #sleep delay_interval  
      @feed_app = AppKey.where("is_pending = ?", "pending")
      if @feed_app.any?
        @feed_app.each do |feed_app|
          if exists? app_key_id: feed_app.id
            update_from_feed(feed_app)
            feed_app.update_attributes(:is_pending => "done")
          else
            add_from_feed(feed_app)
            feed_app.update_attributes(:is_pending => "done")
          end
        end
      end
    #end
  end

  def self.add_from_feed(feed_app)
    @feed_user = feed_app
    feed_url = feed_app.app_url
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries)
  end

  def self.update_from_feed(feed_app)
    @feed_user = feed_app
    feed_url = feed_app.app_url
    feed = Feedzirra::Feed.update(feed)
    add_entries(feed.new_entries) if feed.updated?
  end

  private

    def self.add_entries(entries)
    entries.each do |entry|
      unless exists? guid: entry.id
        @feed_user.feed_entries.create!(
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
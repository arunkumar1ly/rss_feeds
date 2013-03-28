class AppKey < ActiveRecord::Base
  attr_accessible :app, :app_url, :entity_name, :is_pending, :last_processed, :last_requested_processing
  validates :app_url, presence: true, :format => URI::regexp(%w(http https)), uniqueness: { case_sensitive: false }
  before_create :create_object_value
  has_many :feed_entries, dependent: :destroy

  def new_url?(url)
    exists? app_url: url
  end

  private
  
   	def create_object_value
      self.app = "RSS"
      url = URI(self.app_url)
      self.entity_name = url.host
      self.is_pending = "pending"
      self.last_processed = Time.now
  		self.last_requested_processing = Time.now
    end 
end
class FeedEntriesController < ApplicationController
  def index
    @search = FeedEntry.search(params[:search])
    @feed_entries = @search.page(params[:page])
    @app_keys = AppKey.all
  end

  def update
    @feed_article = FeedEntry.find(params[:id])
    @feed_article.toggle!(params[:attribute])
    redirect_to :back
  end

  def show
    @feed_article = FeedEntry.find(params[:id])
    @feed_article.is_to_read = 'false'
    @feed_article.last_clicked_on =  Time.now
    @feed_article.save!
    url = @feed_article.url
    redirect_to url
  end
end
 
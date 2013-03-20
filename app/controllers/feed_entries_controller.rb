class FeedEntriesController < ApplicationController
  def index
    @search = FeedEntry.search(params[:search])
    @feed_entries = @search.page(params[:page])
  end
end
 
class AppKeysController < ApplicationController

  def new
    @app_key = AppKey.new
    @app_keys = AppKey.all
  end

  def create
    @app_key = AppKey.new(params[:app_key])

      if @app_key.save
        flash[:success] ="URL successfully added"
        redirect_to new_app_key_path
      else
        @app_keys = AppKey.all
        render 'new'
      end
  end

  def destroy
    AppKey.find(params[:id]).destroy
    flash[:success] = "URL Deleted Successfully"
    redirect_to new_app_key_path
  end

  def show 
    @app_key = AppKey.find(params[:id])
    @search = FeedEntry.search(params[:search])
    @feed_entries = @app_key.feed_entries.page(params[:page])
    @app_keys = AppKey.all
    #render :template => 'feed_entries/index'
  end

  def update
    @app_key = AppKey.find(params[:id])
    #@app_key.update_attributes(is_pending: "pending")
    @app_key.last_requested_processing =  Time.now
    @app_key.is_pending = "pending"
    @app_key.save!
    redirect_to app_key_path(@app_key)
  end

end
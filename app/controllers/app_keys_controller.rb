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

end
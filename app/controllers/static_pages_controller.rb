class StaticPagesController < ApplicationController
  def home
    @tweet = Tweet.new
    @tweet = current_user.tweets.build if logged_in?
    @tweets = Tweet.all.order(created_at: "DESC").paginate(page: params[:page], per_page: 10) if logged_in?
  end

  def search
    @tweet = Tweet.new
    @tweets = Tweet.search(params[:keyword]).paginate(page: params[:page], per_page: 10) if logged_in?

    @keyword = params[:keyword]
    render "home"
  end

  def help

  end

  def about 
  end

  def contact
  end
end

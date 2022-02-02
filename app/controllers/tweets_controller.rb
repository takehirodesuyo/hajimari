class TweetsController < ApplicationController
  def create
      @tweet = current_user.tweets.build(tweet_params)
      if @tweet.save
          flash[:success] = "投稿されました"
          redirect_to root_url
      else
        render 'static_pages/home'
      end
  end

  private
  

        def tweet_params
            params.require(:tweet).permit(:content)
        end

        def edit
          @tweet = Tweet.find(params[:id])
      end
  

  end

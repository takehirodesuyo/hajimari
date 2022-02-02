class StaticPagesController < ApplicationController
  def home
    @tweet = Tweet.new
  end

  def help
  end

  def about 
  end

  def contact
  end
end

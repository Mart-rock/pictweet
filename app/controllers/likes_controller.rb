class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.like(current_user)
  end

  def destroy
    @tweet = Like.find(params[:id]).tweet
    @tweet.unlike(current_user)
  end
  
end

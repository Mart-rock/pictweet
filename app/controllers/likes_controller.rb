class LikesController < ApplicationController
  before_action :set_tweet

  def create
    @like = Like.create(user_id: current_user.id, tweet_id: @tweet.id)
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, tweet_id: @tweet.id)
    @like.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json
    end
  end

  private
  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end

class TweetsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_tweet, only: [:edit, :update, :destroy, :show]

  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def edit
    # This will prevent the update/delete access to a tweet already published when a view was not refreshed
    if @tweet.published?
      redirect_to tweets_path, alert: "Sorry you can't edit it! This tweet was already published"
    end
  end

  def create
    @tweet = Current.user.tweets.new(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice: "Tweet was successfully scheduled"
    else
      render :new
    end
  end

  def update
    if @tweet.update(tweets_params)
      redirect_to tweets_path, notice: "Tweet was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "Tweet was unscheduled"
  end

  private

  def tweets_params
    params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
  end

  def set_tweet
    @tweet = Current.user.tweets.find_by(id: params[:id])
  end
end

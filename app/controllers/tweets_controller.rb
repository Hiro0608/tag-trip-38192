class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments
  end

  def edit
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :place, :introduction, :image).merge(user_id: current_user.id)
  end
end

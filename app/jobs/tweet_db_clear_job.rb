class TweetDbClearJob < ApplicationJob
  queue_as :default

  def perform
    Tweet.destroy_all
  end
end

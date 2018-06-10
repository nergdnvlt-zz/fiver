namespace :clean do

  desc 'Removes Old Tweets'
  task all: :environment do
    clean_database
  end

  def clean_database
    Tweet.destroy_all
  end
end

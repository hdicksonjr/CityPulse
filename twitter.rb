# require 'rubygems'
# require "tweetstream"


# puts "does this appear??"

#  TweetStream.configure do |config|
#   config.consumer_key       = "CaHo4E8VCYb8ZbjJPAbbsw"
#   config.consumer_secret    = "zH6Zk9DEl50lxdkaNpXH6mU8Xay9jafG9M1kZhwuQ"
#   config.oauth_token        = "1923959803-k1c9waBgwF5yuKog4fVTRoNn7XjyT1hRjRQVGtg"
#   config.oauth_token_secret = "496knN5ri5y6ezbuonf8oTiGerR8wWTiEvf407B8dsGPj"
#   config.auth_method        = :oauth
# end

# # Working combinations:
# # Locally:
# #   No Rake:
# #     Client && ruby twitter.rb start
# #     Client && ruby twitter.rb run
# #     Daemon.new('tracker') && ruby twitter.rb start
# #     Daemon.new('tracker') && ruby twitter.rb run
# # Heroku Procfile
# #   No Rake:
# #     Client && ruby twitter.rb start
# #     Client && ruby twitter.rb run
# #     Daemon.new('tracker') && ruby twitter.rb start
# #     Daemon.new('tracker') && ruby twitter.rb run

# puts "does this appear??"
# TweetStream::Client.new.locations(-87.739906, 41.816073, -87.639656, 41.956139) do |status, client|
#   raise "I AM SMOKE!"
#   puts "#{status.text}"
#   puts "#{status[:user][:screen_name]}"
#   puts "#{status[:geo][:coordinates]}"
#   puts "#{status[:user][:profile_image_url_https]}"
#   puts " ++++++++++++++++++++++++++"
# end

 gem "tweetstream"
 gem "pusher"
 require "tweetstream"
 require "pusher"

 puts "hello"

 TweetStream.configure do |config|
      config.consumer_key       = "2LLhLNd4A8hzgnAqGQkH7Q"
      config.consumer_secret    = "irPBysCEpUe36Zh6qSD7rKp9fAaZdFMYSZk3McbcHJg"
      config.oauth_token        = "1923959803-jFUE3Qf0NDABDShVPKjUccZgoBChIneWBwOSPxK"
      config.oauth_token_secret = "k4Z8swE7MLeG3lNmy5G1t55NfYcYJ3lMKNSee8UjA"
      config.auth_method        = :oauth
    end
 p "hello"
    TweetStream::Client.new.locations(-87.739906, 41.816073, -87.639656, 41.956139) do |status, client|
      puts "#{status.text}"
      puts "#{status[:user][:screen_name]}"
      puts "#{status[:geo][:coordinates]}"
      puts "#{status[:user][:profile_image_url_https]}"
      puts " ++++++++++++++++++++++++++"

      Pusher.url = "http://86bccb7dee9d1aea8897:fef3061fded8a4bd2023@api.pusherapp.com/apps/57591"
      @tweet = [status[:geo][:coordinates], status.text, status[:user][:screen_name],status[:user][:profile_image_url_https]]
      if @tweet[0][0] < 42.022686 && @tweet[0][0] > 41.774084 && @tweet[0][1] > -87.957573 && @tweet[0][1] < -87.501812 && @tweet[1][0] != "@"
        Pusher['twitter_channel'].trigger('twitter_event', {
          message: @tweet
          })
      end
end


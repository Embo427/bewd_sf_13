#1 - Pull the json from the reddit API via
  # http://www.reddit.com/.json
  # http://mashable.com/stories.json
#2 - Parse it using the JSON library
#3 - Find the stories based on techniques used in the code_along (max of 25 provided)
#4 - Create a new story hash out of each story with the following keys :title, :upvotes and :category
    #title, #category and #upvotes may not be the names used - subreddit & ups
#5 - Add each story to an array
#6 - Print each story from the array on your "Front Page"
#7 - BONUS ### create an 'csv' file using the api data & Ruby's CSV library
     # -> http://ruby-doc.org/stdlib-2.2.2/libdoc/csv/rdoc/CSV.html
         #title, upvote, category are the required columns

require 'typhoeus'#library that faciltates http requests
require 'pry'
require 'pry-byebug'
require 'json'
require 'CSV'

def connect_to_api(url)
  response = Typhoeus.get(url)
  JSON.parse(response.body)
end

def find_stories(response)
  all_stories = response["data"]["children"]
  parse_stories(all_stories)
end

def parse_stories(all_stories)
  all_stories.each do |story|
    create_story_hash(story)
  end
end

def create_story_hash(story)
  title = story["data"]["title"]
  upvotes = story["data"]["ups"]
  category = story["data"]["subreddit"]
  story_details = {title:"#{title}", upvotes:"#{upvotes}",category:"#{category}"}
  create_story_array(story_details)
end

def create_story_array(story_details)
  story_array = []
  story_array.push(story_details)
  front_page(story_array)
end

def front_page(story_array)
  story_array.each do |printed_story|
    puts printed_story
  end
  # create_csv(story_array)
end

def create_csv(story_array)
  CSV.open('test.csv', options=story_array)
end

reddit_url ='http://www.reddit.com/.json'
reddit_json_response = connect_to_api(reddit_url)
find_stories(reddit_json_response)

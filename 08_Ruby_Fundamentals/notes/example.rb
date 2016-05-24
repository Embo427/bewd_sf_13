require 'mechanize'
require 'logger'
require 'pry-byebug'

agent = Mechanize.new
agent.log = Logger.new "mech.log"
agent.user_agent_alias = 'Mac Safari'

page = agent.get "http://www.google.com/"
search_form = page.form_with :name => "f"
search_form.field_with(:name => "q").value = "Hello"

search_results = agent.submit search_form
puts search_results.body

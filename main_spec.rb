require File.dirname(__FILE__) + '/main.rb'
require 'rack/test'
require 'capybara/rspec' #installs the rspec inside the capybara folder

# Capybara.app = Sinatra::Application

set :environment, :test

def app
  Capybara.app = Sinatra::Application
end

describe 'Home', :type => :feature do
  include Rack::Test::Methods
  
  it 'should load the homepage' do
    get '/'
    last_response.should be_ok
  end

  it 'should contain h1 tag with Songs By Nancy' do
    visit '/'
    page.should have_selector('h1', text: 'Songs By Nancy')
  end

  it "displays the menu" do
    visit '/'
    page.should have_selector('nav li')
  end
end

#  it "should have the correct title " do
#       response.should have_selector("title",
#                                 :content => @base_title + " | Home")
# end
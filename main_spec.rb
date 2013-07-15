require File.dirname(__FILE__) + '/main.rb'
require 'rack/test'
require 'capybara/rspec'

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
end

describe 'Nav' do
  it "displays the menu" do
    render :partial => "nav"
    page.should have_selector('li')
  end
end
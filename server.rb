require 'sinatra/base'
require 'bing-search'

class SearchAndMap < Sinatra::Base

  get '/' do
    'Hello World'
  end

  get '/search' do
    BingSearch.account_key = ENV['THE_KEY']
    BingSearch.web_only = true
    @results = BingSearch.web(params[:search], limit: 3, adult: 'Strict', market: 'en-GB')
    erb :search
  end
end

require 'rubygems'

gem 'hashie', '~> 0.1.3'
require 'hashie'

gem 'httparty', '~> 0.4.3'
require 'httparty'

gem 'activesupport', '~> 2.3.2'
require 'activesupport'

class Nextstop
  
  include HTTParty
  base_uri 'api.nextstop.com'
  format :json
  
  attr_accessor :api_key
  
  def initialize(api_key)
    self.api_key = api_key
  end
  
  def search(options={})
    mashup(self.class.get("/search/", :query => default_options.merge(options)))
  end
  
  def search_guides(options={})
    search options.merge({:result_type => 'guides'})
  end
  
  def search_places(options={})
    search options.merge({:result_type => 'places'})
  end
  
  def place(place_id, options={})
    mashup(self.class.get("/p/#{place_id}/", :query => default_options.merge(options)))
  end
  
  def guide(guide_id, options={})
    mashup(self.class.get("/guide/#{guide_id}/", :query => default_options.merge(options)))
  end
  
  private
    def default_options
      {:key => self.api_key}
    end
    
    def mashup(response)
      if response['status'].to_i == 200 
        Hashie::Mash.new(response['data'])
      else
        Hashie::Mash.new response
      end
    end
  
end
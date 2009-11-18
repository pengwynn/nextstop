require 'helper'

class TestReadernaut < Test::Unit::TestCase
  context "When hitting the Nextstop API" do
    setup do
      @nextstop = Nextstop.new('OU812')
    end
    
    should "return info for a place" do
      stub_get "http://api.nextstop.com/p/nzp9KFPK4ok/?key=OU812", "place.json"
      place = @nextstop.place('nzp9KFPK4ok')
      place.address.should == '1801 N Griffin St'
      place.keywords.size.should == 8
    end
    
    should "return info for a guide" do
      stub_get "http://api.nextstop.com/guide/nzp9KFPK4ok/?key=OU812", "guide.json"
      guide = @nextstop.guide('nzp9KFPK4ok')
      guide.permalink.should == 'http://www.nextstop.com/guide/nzp9KFPK4ok/alicias-favorites-in-the-dfw-metroplex/'
      guide.guideContent['count'].should == 8
    end
    
    should "search places" do
      stub_get "http://api.nextstop.com/search/?q=dallas&result_type=places&key=OU812", "places_search.json"
      results = @nextstop.search_places(:q => 'dallas')
      results.totalResults.should == 100
      results.resultsList.first.locationName.should == 'Dallas'
    end
    
  end
end
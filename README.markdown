# nextstop

nextstop is a community effort to build a catalog of all the best things to do, places to go, and experiences to try anywhere in the world. The nextstop gem wraps the API to let you search for places and guides from the nextstop community.

## Installation

  sudo gem install gemcutter
  gem tumble
  
  sudo gem install nextstop
  
  
## Usage

You'll need to start by obtaining an [API key](http://www.nextstop.com/api/get_key/)
  
  # init the nextstop client with your api key
  nextstop = Nextstop.new('OU812')
  
  nextstop.search_guides(:q => 'Dallas')
  
  nextstop.search_places(:q => 'Dallas')
  
  nextstop.guide('nzp9KFPK4ok')
  
  nextstop.place('kgOslXII8bo')
  
Check the [API Docs](http://www.nextstop.com/api/docs/) for a full list of options for each method

### Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

### Copyright

Copyright (c) 2009 Wynn Netherland. See LICENSE for details.

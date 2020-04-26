require "coronapp/version"
require "open-uri"
require "json"

module Coronapp
  class Error < StandardError; end
  
  class Stat
    def get_stat(given_stat)
      stat_hash = {new: "new_daily_cases", deaths: "new_daily_deaths", total: "total_cases", recovered:"total_recoveries",toll: "total_deaths"}
      return stat_hash[given_stat]
    end
  end  
  
  def self.get(options = {})
      country = options.fetch(:country).upcase
      date = options.fetch(:date).strftime("%-m/%-d/%y")
      stat = options.fetch(:stat).to_sym
      url = "https://api.thevirustracker.com/free-api?countryTimeline=#{country}"
      s = Stat.new
      result = open(url).read
      return "#{JSON.parse(result).dig("timelineitems",0, date, s.get_stat(stat))} #{s.get_stat(stat).gsub("_", " ")}"
  end
end

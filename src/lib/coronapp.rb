require "coronapp/version"
require "open-uri"
require "json"

class
  CountryError < StandardError
end

module Coronapp
  class Error < StandardError; end
  
  class Stat
    def get_stat(given_stat)
      # begin 
      stat_hash = {new: "new_daily_cases", deaths: "new_daily_deaths", total: "total_cases", recovered:"total_recoveries",toll: "total_deaths"}
      return stat_hash[given_stat]
    end

    def cache(result, country, date)
      return File.write("./cache/#{country}.json", result) unless (File.exist? "./cache/#{country}.json") && (JSON.parse(File.read("./cache/#{country}.json")).dig("timelineitems",0).key?(date))
    end

    Country = Struct.new(:id, :name)

    def validate_country(id)
      not_found = ->{ raise CountryError }
      [ Country.new("AF" , "Afghanistan" ),
      Country.new("AL" , "Albania" ),
      Country.new("DZ" , "Algeria" ),
      Country.new("AO" , "Angola" ),
      Country.new("AR" , "Argentina" ),
      Country.new("AM" , "Armenia" ),
      Country.new("AU" , "Australia" ),
      Country.new("AT" , "Austria" ),
      Country.new("AZ" , "Azerbaijan" ),
      Country.new("BS" , "Bahamas" ),
      Country.new("BD" , "Bangladesh" ),
      Country.new("BY" , "Belarus" ),
      Country.new("BE" , "Belgium" ),
      Country.new("BZ" , "Belize" ),
      Country.new("BJ" , "Benin" ),
      Country.new("BT" , "Bhutan" ),
      Country.new("BO" , "Bolivia" ),
      Country.new("BA" , "Bosnia and Herzegovina" ),
      Country.new("BW" , "Botswana" ),
      Country.new("BR" , "Brazil" ),
      Country.new("BN" , "Brunei Darussalam" ),
      Country.new("BG" , "Bulgaria" ),
      Country.new("BF" , "Burkina Faso" ),
      Country.new("BI" , "Burundi" ),
      Country.new("KH" , "Cambodia" ),
      Country.new("CM" , "Cameroon" ),
      Country.new("CA" , "Canada" ),
      Country.new("CI" , "Ivory Coast" ),
      Country.new("CF" , "Central African Republic" ),
      Country.new("TD" , "Chad" ),
      Country.new("CL" , "Chile" ),
      Country.new("CN" , "China" ),
      Country.new("CO" , "Colombia" ),
      Country.new("CG" , "Congo" ),
      Country.new("CD" , "Democratic Republic of Congo" ),
      Country.new("CR" , "Costa Rica" ),
      Country.new("HR" , "Croatia" ),
      Country.new("CU" , "Cuba" ),
      Country.new("CY" , "Cyprus" ),
      Country.new("CZ" , "Czechia" ),
      Country.new("DK" , "Denmark" ),
      Country.new("DP" , "Diamond Princess" ),
      Country.new("DJ" , "Djibouti" ),
      Country.new("DO" , "Dominican Republic" ),
      Country.new("CD" , "DR Congo" ),
      Country.new("EC" , "Ecuador" ),
      Country.new("EG" , "Egypt" ),
      Country.new("SV" , "El Salvador" ),
      Country.new("GQ" , "Equatorial Guinea" ),
      Country.new("ER" , "Eritrea" ),
      Country.new("EE" , "Estonia" ),
      Country.new("ET" , "Ethiopia" ),
      Country.new("FK" , "Falkland Islands" ),
      Country.new("FJ" , "Fiji" ),
      Country.new("FI" , "Finland" ),
      Country.new("FR" , "France" ),
      Country.new("GF" , "French Guiana" ),
      Country.new("TF" , "French Southern Territories" ),
      Country.new("GA" , "Gabon" ),
      Country.new("GM" , "Gambia" ),
      Country.new("GE" , "Georgia" ),
      Country.new("DE" , "Germany" ),
      Country.new("GH" , "Ghana" ),
      Country.new("GR" , "Greece" ),
      Country.new("GL" , "Greenland" ),
      Country.new("GT" , "Guatemala" ),
      Country.new("GN" , "Guinea" ),
      Country.new("GW" , "Guinea-Bissau" ),
      Country.new("GY" , "Guyana" ),
      Country.new("HT" , "Haiti" ),
      Country.new("HN" , "Honduras" ),
      Country.new("HK" , "Hong Kong" ),
      Country.new("HU" , "Hungary" ),
      Country.new("IS" , "Iceland" ),
      Country.new("IN" , "India" ),
      Country.new("ID" , "Indonesia" ),
      Country.new("IR" , "Iran" ),
      Country.new("IQ" , "Iraq" ),
      Country.new("IE" , "Ireland" ),
      Country.new("IL" , "Israel" ),
      Country.new("IT" , "Italy" ),
      Country.new("JM" , "Jamaica" ),
      Country.new("JP" , "Japan" ),
      Country.new("JO" , "Jordan" ),
      Country.new("KZ" , "Kazakhstan" ),
      Country.new("KE" , "Kenya" ),
      Country.new("KP" , "Korea" ),
      Country.new("XK" , "Kosovo" ),
      Country.new("KW" , "Kuwait" ),
      Country.new("KG" , "Kyrgyzstan" ),
      Country.new("LA" , "Lao" ),
      Country.new("LV" , "Latvia" ),
      Country.new("LB" , "Lebanon" ),
      Country.new("LS" , "Lesotho" ),
      Country.new("LR" , "Liberia" ),
      Country.new("LY" , "Libya" ),
      Country.new("LT" , "Lithuania" ),
      Country.new("LU" , "Luxembourg" ),
      Country.new("MK" , "Macedonia" ),
      Country.new("MG" , "Madagascar" ),
      Country.new("MW" , "Malawi" ),
      Country.new("MY" , "Malaysia" ),
      Country.new("ML" , "Mali" ),
      Country.new("MR" , "Mauritania" ),
      Country.new("MX" , "Mexico" ),
      Country.new("MD" , "Moldova" ),
      Country.new("MN" , "Mongolia" ),
      Country.new("ME" , "Montenegro" ),
      Country.new("MA" , "Morocco" ),
      Country.new("MZ" , "Mozambique" ),
      Country.new("MM" , "Myanmar" ),
      Country.new("NA" , "Namibia" ),
      Country.new("NP" , "Nepal" ),
      Country.new("NL" , "Netherlands" ),
      Country.new("NC" , "New Caledonia" ),
      Country.new("NZ" , "New Zealand" ),
      Country.new("NI" , "Nicaragua" ),
      Country.new("NE" , "Niger" ),
      Country.new("NG" , "Nigeria" ),
      Country.new("KP" , "North Korea" ),
      Country.new("NO" , "Norway" ),
      Country.new("OM" , "Oman" ),
      Country.new("PK" , "Pakistan" ),
      Country.new("PS" , "Palestine" ),
      Country.new("PA" , "Panama" ),
      Country.new("PG" , "Papua New Guinea" ),
      Country.new("PY" , "Paraguay" ),
      Country.new("PE" , "Peru" ),
      Country.new("PH" , "Philippines" ),
      Country.new("PL" , "Poland" ),
      Country.new("PT" , "Portugal" ),
      Country.new("PR" , "Puerto Rico" ),
      Country.new("QA" , "Qatar" ),
      Country.new("XK" , "Republic of Kosovo" ),
      Country.new("RO" , "Romania" ),
      Country.new("RU" , "Russia" ),
      Country.new("RW" , "Rwanda" ),
      Country.new("SA" , "Saudi Arabia" ),
      Country.new("SN" , "Senegal" ),
      Country.new("RS" , "Serbia" ),
      Country.new("SL" , "Sierra Leone" ),
      Country.new("SG" , "Singapore" ),
      Country.new("SK" , "Slovakia" ),
      Country.new("SI" , "Slovenia" ),
      Country.new("SB" , "Solomon Islands" ),
      Country.new("SO" , "Somalia" ),
      Country.new("ZA" , "South Africa" ),
      Country.new("KR" , "South Korea" ),
      Country.new("SS" , "South Sudan" ),
      Country.new("ES" , "Spain" ),
      Country.new("LK" , "Sri Lanka" ),
      Country.new("SD" , "Sudan" ),
      Country.new("SR" , "Suriname" ),
      Country.new("SJ" , "Svalbard and Jan Mayen" ),
      Country.new("SZ" , "Swaziland" ),
      Country.new("SE" , "Sweden" ),
      Country.new("CH" , "Switzerland" ),
      Country.new("SY" , "Syrian Arab Republic" ),
      Country.new("TW" , "Taiwan" ),
      Country.new("TJ" , "Tajikistan" ),
      Country.new("TZ" , "Tanzania" ),
      Country.new("TH" , "Thailand" ),
      Country.new("TL" , "Timor-Leste" ),
      Country.new("TG" , "Togo" ),
      Country.new("TT" , "Trinidad and Tobago" ),
      Country.new("TN" , "Tunisia" ),
      Country.new("TR" , "Turkey" ),
      Country.new("TM" , "Turkmenistan" ),
      Country.new("AE" , "UAE" ),
      Country.new("UG" , "Uganda" ),
      Country.new("GB" , "United Kingdom" ),
      Country.new("UA" , "Ukraine" ),
      Country.new("US" , "USA" ),
      Country.new("UY" , "Uruguay" ),
      Country.new("UZ" , "Uzbekistan" ),
      Country.new("VU" , "Vanuatu" ),
      Country.new("VE" , "Venezuela" ),
      Country.new("VN" , "Vietnam" ),
      Country.new("EH" , "Western Sahara" ),
      Country.new("YE" , "Yemen" ),
      Country.new("ZM" , "Zambia" ),
      Country.new("ZW" , "Zimbabwe" ) ].find(not_found) do |u|
      u.id == id
        end
    end

  #   def validate_country(id)
  #     country_array = ["AU", "US", "GB"]
  #     (country_array.include? id) ? return id : raise
  #   end
  end  
  
  def self.get(options = {})
      country = options.fetch(:country).upcase
      date = options.fetch(:date).strftime("%-m/%-d/%y")
      stat = options.fetch(:stat).downcase.to_sym
      url = "https://api.thevirustracker.com/free-api?countryTimeline=#{country}"
      s = Stat.new
      result = URI.open(url).read
      s.validate_country(country)
      s.cache(result, country, date)
      return "#{JSON.parse(File.read("./cache/#{country}.json")).dig("timelineitems",0, date, s.get_stat(stat))} #{s.get_stat(stat).gsub("_", " ")}"
  end
end


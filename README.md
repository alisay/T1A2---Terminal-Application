# Coronapp

## Statement of Purpose and Scope

This application provides a user with information related to the spread of COVID-19 internationally. It takes user input in the form of a country code, date, and desired statistic (of daily deaths, daily new cases, total cases, total deaths and total recoveries) and returns a number taken from an API relying on up-to-date World Health Organisation data. The application solves the problem of individuals needing to access information relating to public health, but being overwhelmed by complicated analyses, large amounts of data, or distracting graphical user interfaces. The goal is to allow concerned individuals to evaluate the comparative severity of the disease in different countries in order to inform their personal decisions, including travel plans, distancing strategy or degree of self-satisfaction. The user will use the application by entering a country, chosing which statistic they wish to view and entering a date. This will return a statistic in the form of a sentence string. The user can use the help menu to view a directory of countries and the codes to be used within the command line arguments, a list of statistics that are available, and instructions on date formatting. 


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coronapp'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install coronapp

## Usage

This app takes three terminal line arguments: country, date and statistic. 

For example, from the root directory of the Gemfile, you can run:  

```bash
    ./exe/coronapp -c "AU" -d "20 April 2020" -s "toll" 
```

This will return the total deaths from coronavirus in Australia on 20 April this year. 

If you forget these instructions, just run the --help command. 

```bash
    ./exe/coronapp -h
```

The available statistics are: 

New --> returns the new cases of coronavirus on this day
Deaths --> returns the number of deaths from coronavirus on this day
Total --> returns the total number of coronavirus cases on this day
Recovered --> returns the number of people who have recovered from coronavirus
Toll --> returns the total number of deaths from coronavirus 

The countries whose statistics can be accessed are: 

    AF Afghanistan      DE Germany          PK Pakistan
    AL Albania          GH Ghana            PS Palestine
    DZ Algeria          GR Greece           PA Panama
    AO Angola           GL Greenland        PG Papua New Guinea
    AR Argentina        GT Guatemala        PY Paraguay
    AM Armenia          GN Guinea           PE Peru
    AU Australia        GW Guinea-Bissau    PH Philippines
    AT Austria          GY Guyana           PL Poland
    AZ Azerbaijan       HT Haiti            PT Portugal
    BS Bahamas          HN Honduras         PR Puerto Rico
    BD Bangladesh       HK Hong Kong        QA Qatar
    BY Belarus          HU Hungary          XK Republic of Kosovo
    BE Belgium          IS Iceland          RO Romania
    BZ Belize           IN India            RU Russia
    BJ Benin            ID Indonesia        RW Rwanda
    BT Bhutan           IR Iran             SA Saudi Arabia
    BO Bolivia          IQ Iraq             SN Senegal
    BA Bosnia/Herz      IE Ireland          RS Serbia
    BW Botswana         IL Israel           SL Sierra Leone
    BR Brazil           IT Italy            SG Singapore
    BN Brunei           JM Jamaica          SK Slovakia
    BG Bulgaria         JP Japan            SI Slovenia
    BF Burkina Faso     JO Jordan           SB Solomon Islands
    BI Burundi          KZ Kazakhstan       SO Somalia
    KH Cambodia         KE Kenya            ZA South Africa
    CM Cameroon         KP Korea            KR South Korea
    CA Canada           XK Kosovo           SS South Sudan
    CI Ivory Coast      KW Kuwait           ES Spain
    CF CAR              KG Kyrgyzstan       LK Sri Lanka
    TD Chad             LA Lao              SD Sudan
    CL Chile            LV Latvia           SR Suriname
    CN China            LB Lebanon          SJ Svalbard and Jan Mayen
    CO Colombia         LS Lesotho          SZ Swaziland
    CG Congo            LR Liberia          SE Sweden
    CD DR Congo         LY Libya            CH Switzerland
    CR Costa Rica       LT Lithuania        SY Syrian Arab Republic
    HR Croatia          LU Luxembourg       TW Taiwan
    CU Cuba             MK Macedonia        TJ Tajikistan
    CY Cyprus           MG Madagascar       TZ Tanzania
    CZ Czechia          MW Malawi           TH Thailand
    DK Denmark          MY Malaysia         TL Timor-Leste
    DP Diamond Princess ML Mali             TG Togo
    DJ Djibouti         MR Mauritania       TT Trinidad and Tobago
    DO Dominican Repub  MX Mexico           TN Tunisia
    CD DR Congo         MD Moldova          TR Turkey
    EC Ecuador          MN Mongolia         TM Turkmenistan
    EG Egypt            ME Montenegro       AE UAE
    SV El Salvador      MA Morocco          UG Uganda
    GQ Equatorial GuineaMZ Mozambique       GB United Kingdom
    ER Eritrea          MM Myanmar          UA Ukraine
    EE Estonia          NA Namibia          US USA
    ET Ethiopia         NP Nepal            UY Uruguay
    FK Falkland Islands NL Netherlands      UZ Uzbekistan
    FJ Fiji             NC New Caledonia    VU Vanuatu
    FI Finland          NZ New Zealand      VE Venezuela
    FR France           NI Nicaragua        VN Vietnam
    GF French Guiana    NE Niger            EH Western Sahara
    TF French ST        NG Nigeria          YE Yemen
    GA Gabon            KP North Korea      ZM Zambia
    GM Gambia           NO Norway           ZW Zimbabwe
    GE Georgia          OM Oman

## Features

This app has three features: 

1. Scrape 

This is a module which defines a static function taking three variables as arguments: country, date and statistic. It scrapes a url using the gem open-uri. This url is taken from an online API, and completed as a string using the country argument. The data returned from this is saved into a local variable. Using the json gem, the same function parses this variable and returns the relevant statistic. In order to do this, it uses a private class to define a function which translates the user-entered statistic into a well-formed string. Error handling inherits from the standard class. I have ensured that user input which is a date object or wrongly capitalized can be handled. 

2. Opt-Parse

This is a class for analysing the arguments entered in the command line by the user, using the Option Parser gem which is bundled with ruby. It specifies the arguments which are mandatory - country, date, and statistic - as well as outlining what type of variable it expects these to be, and automatically generates a help menu for the commands. Using the optparse/date module, I can coerce the string entered as an argument for date into a date object. Opt-parse also allows me to store the arguments in a hash, which is used as an argument in the get function described above. 

3. Main function

This code handles the arguments specified in opt-parse above and returns a string with the scrape module method interpolated. The error handling at this stage rescues an error where there are insufficient arguments and an error where there are invalid arguments and ensures that a well formed error message is returned, which suggests that the user access the help menu.  


## User Interaction and Experience	 

The user will learn how to interact with the application through a README file accessible on the public github repository. This file will explain how to install the app as well as install any dependencies using bundle install. It will also include usage instructions with examples. During use of the application, if a user enters incorrect information – for example, if a user were to enter too few arguments – the application will prompt the user as to the nature of the error and suggest that they view the help menu of the application by typing --help. These choices have been made to closely mirror how command line applications typically function, rather than mimicking the style of a graphical user interface 

## Control Flow Diagram

```bash
+-----------+
|           |                        +----------+
|  Country  +---------+              |          |
|           |         |              |  Help!   |
+-----+-----+         |              |          |
      |               |              +----------+
+-----+-----+         |
|           |         |
|  Date     +---------+
|           |         |
+-----+-----+         |
      |               |
+-----+-----+         |
|           |         |
| Statistic +---------+
|           |         |
+-----------+         |
                      |
                      v
                 +----+----+
                 |         |
                 | Result  |
                 |         |
                 +---------+

```

## Implementation Plan

See [trello board](https://trello.com/invite/b/pc6pvNan/539072041e9035a6fe2a3abbf52086e8/coronapp) for implementation plan. 

## Status Updates

#### 21 April 2020

I am confused about whether the main scraping method should be wrapped in a module or a class. Zeb gives feedback that a module should be used where it's a static method that can be repurposed elsewhere in the program or a single instance of an object. He suggests that if I want to have a class I could have a way of caching the data from each time I scrape the website by saving it to a file. This file could then instantiate an object that populates a hash using country/date data as the key, and scraped data as the value. (I think this is what he said but my scribbles are pretty unclear). I spend a long time working out how to use a gem called vcr which can save websites to a "cassettes" folder. I work out how to set the configurations for vcr and write a module that can be imported into the search class which checks that each "cassette" doesn't already exist, and it is great but then I realise I could have done the same thing with a single line of code which is easier anyway because I can't figure out how to change the configuration settings in order to save the cassettes as JSON instead of YAML and I don't know how to read the YAML file and I am tired. 

#### 25 April 2020

I decide it's time to work out how to call another method within the self.method I have within my scrape module so that I can take input of which statistic the user wants returned by using a hash with user input as key and the string that's used on the website I'm scraping as value. What a sentence. This takes a surprisingly long time because I don't know how to google. I keep getting an error that says the 
```bash 
undefined method `get_stat' for Corona:Module (NoMethodError)
```
It's not undefined! I defined it right there above the method that's calling it as part of the JSON parse thing. Eventually I think I search for "call function inside module ruby self function" which leads me to a Stack Overflow question which is unhelpful except for some fellow called 'bin-tom' who says something in the comments about defining private methods before you use them and then I google what a private method is and then I find out that I can make a class within a module that deals with logic so that the module spits out the right data with the method I'm actually calling in the option parser part of the program. Why is this so complicated? I just want to deal with functions in order and not have to think about who is interfacing with what please. Anyway the important thing is that it works now and I only forgot to put inverted commas around strings about 5000 times in the process. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alisay/coronapp.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


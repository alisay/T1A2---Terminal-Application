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

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Features

TODO: Describe features here

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


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alisay/coronapp.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


## Status Updates

#### 21 April 2020

I am confused about whether the main scraping method should be wrapped in a module or a class. Zeb gives feedback that a module should be used where it's a static method that can be repurposed elsewhere in the program or a single instance of an object. He suggests that if I want to have a class I could have a way of caching the data from each time I scrape the website by saving it to a file. This file could then instantiate an object that populates a hash using country/date data as the key, and scraped data as the value. (I think this is what he said but my scribbles are pretty unclear). I spend a long time working out how to use a gem called vcr which can save websites to a "cassettes" folder. I work out how to set the configurations for vcr and write a module that can be imported into the search class which checks that each "cassette" doesn't already exist, and it is great but then I realise I could have done the same thing with a single line of code which is easier anyway because I can't figure out how to change the configuration settings in order to save the cassettes as JSON instead of YAML and I don't know how to read the YAML file and I am tired. 

#### 25 April 2020

I decide it's time to work out how to call another method within the self.method I have within my scrape module so that I can take input of which statistic the user wants returned by using a hash with user input as key and the string that's used on the website I'm scraping as value. What a sentence. This takes a surprisingly long time because I don't know how to google. I keep getting an error that says the 
```bash 
undefined method `get_stat' for Corona:Module (NoMethodError)
```
It's not undefined! I defined it right there above the method that's calling it as part of the JSON parse thing. Eventually I think I search for "call function inside module ruby self function" which leads me to a Stack Overflow question which is unhelpful except for some fellow called 'bin-tom' who says something in the comments about defining private methods before you use them and then I google what a private method is and then I find out that I can make a class within a module that deals with logic so that the module spits out the right data with the method I'm actually calling in the option parser part of the program. Why is this so complicated? I just want to deal with functions in order and not have to think about who is interfacing with what please. Anyway the important thing is that it works now and I only forgot to put inverted commas around strings about 5000 times in the process. 


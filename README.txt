How to run the SearchCLI

-1) Install dependencies
    -- For Ruby (on MacOS), run the following in your terminal:
        ---a) brew install rbenv ruby-build
        ---b) rbenv install 2.5.1
        ---c) ruby -v
-2) For RSpec (on MacOS), run the following in your terminal:
    --a) gem install rspec
-3) Clone the Github Repo into your local directory
-4) Move into the local directory
-5) Run the following in your terminal to start the SearchCLI program:
    --a) ruby lib/app.rb
-6) If you wish to run the RSpec tests, run the following code in your terminal:
    --a) rspec --format doc


Program information
Uses Ruby 2.5.1
Uses RSpec 3.8
  - rspec-core 3.8.0
  - rspec-expectations 3.8.1
  - rspec-mocks 3.8.0
  - rspec-rails 3.8.0
  - rspec-support 3.8.0

Test Coverage
Tests were written using RSpec for the controllers and psuedo models. Controller tests checked that the search method had search terms and matched results - to ensure that the resulting search would work. The controller tests also checked that the list method returned an array from the pseudo model. Pseudo model tests were similar in design, ensuring that the initialized data returned an array.

Overview of solution
The SearchCLI is built from scratch in ruby. No external libraries were used, apart from RSpec for testing and JSON for parsing json files. This was a deliberate decision - not because I’m uncomfortable using libraries but to demonstrate my capabilities.

The search program is designed to mirror an MVC paradigm (as much as is possible when working in the terminal). The app.rb file starts the program by initializing and linking all necessary files and data, before loading the router. The router is then responsible for running the program, presenting the menu, and triggering the right cascading actions when the user selects a menu option. From here, the the program is divided into 5 main modules (controllers, views, pseudo models, search, and data). 

The controllers are the first class type that the router interacts with, and each controller is responsible for handling any user requests relating to a specific theme of query (i.e. user controller will load and search user data, and will present user data back to the terminal via the user view). The controllers coordinate how the rest of the modules interact with each other. 

The pseudo model classes behave similarly to models in and MVC, but also act as the DB in the sense that it converts raw data and holds it here as a ruby hash. They read in data from their respective data file, and pass this data on to their respective controller. 

The view classes handle all interaction with the user. They handle the methods that ask (and get) the search input from the user, and they are responsible for turning raw data into understandable and meaningful information that is presented to the user.

The search classes represent extendible methods that don’t necessarily belong in a controller, but handle import functionality. They are responsible for taking in lists objects, finding a match to the users search query, and returning the matched object and all of its related entities. It is in this sense the search classes also provide the ‘relational’ connections between different data types.

Finally, the 5th module “Data”, contains the raw json objects that the program parses.

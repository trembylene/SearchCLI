# Load required files
require_relative 'json_data'
require_relative 'controller'
require_relative 'router'

# To take out after code is done
require 'pry-byebug'

json_file = File.read('lib/users.json')
# idea for all files - make file directory, loop over each file and parse into array
# put each array into one big array
# use big array for searching data

json_data = JsonData.new(json_file)
controller = Controller.new(json_data)

router = Router.new(controller)

# Start the app
router.run

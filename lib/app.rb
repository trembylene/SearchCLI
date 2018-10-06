# Load required files
require_relative 'data'
require_relative 'controller'
require_relative 'router'

# To take out after code is done
require 'pry-byebug'

json_file = File.read('lib/users.json')
json_data = JsonData.new(json_file)
controller = Controller.new(json_data)

router = Router.new(controller)

# Start the app
router.run

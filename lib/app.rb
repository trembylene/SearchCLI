# Load required files
require_relative 'user_data'
require_relative 'user_controller'
require_relative 'router'

# To take out after code is done
require 'pry-byebug'

user_file = File.read('lib/users.json')

user_data = UserData.new(user_file)
user_controller = UserController.new(user_data)

router = Router.new(user_controller)

# Start the app
router.run

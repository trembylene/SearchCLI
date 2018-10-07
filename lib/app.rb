# Load required user files
require_relative 'user_data'
require_relative 'users_controller'

# Load required ticket files
require_relative 'ticket_data'
require_relative 'tickets_controller'

require_relative 'router'

# To take out after code is done
require 'pry-byebug'

# Initialize user files
user_file = File.read('lib/data/users.json')
user_data = UserData.new(user_file)
users_controller = UsersController.new(user_data)

# Initialize ticket files
ticket_file = File.read('lib/data/tickets.json')
ticket_data = TicketData.new(ticket_file)
tickets_controller = TicketsController.new(ticket_data)

router = Router.new(users_controller, tickets_controller)

# Start the app
router.run

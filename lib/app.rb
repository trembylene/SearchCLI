# Load required user files
require_relative 'pseudo_models/user_data'
require_relative 'controllers/users_controller'

# Load required ticket files
require_relative 'pseudo_models/ticket_data'
require_relative 'controllers/tickets_controller'

# Load required organization files
require_relative 'pseudo_models/organization_data'
require_relative 'controllers/organizations_controller'

# Load router file
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

# Initialize organization files
organization_file = File.read('lib/data/organizations.json')
organization_data = OrganizationData.new(organization_file)
organizations_controller = OrganizationsController.new(organization_data)

# rubocop:disable LineLength
router = Router.new(users_controller, tickets_controller, organizations_controller)
# rubocop:enable LineLength

# Start the app
router.run(organizations_controller, tickets_controller, users_controller)

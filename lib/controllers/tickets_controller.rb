require_relative '../views/ticket_view'
require_relative '../methods/ticket_search'

# Handling all user requests coming from the router, 
# this class acts as the controller for all Ticket related requests,
# and coordinates connections between related files in the application.
class TicketsController
  def initialize(ticket_data)
    # loads necessary data and initializes classes
    @ticket_data = ticket_data.ticket_data_hash
    @ticket_search = TicketSearch.new
    @ticket_view = TicketView.new
  end

  def list
    # returns all ticket data
    @ticket_data
  end

  def search(users_controller, organizations_controller)
    # search method to return results to the terminal, 
    # via coordiation between necessary data, views,
    # and methods
    @organizations_controller = organizations_controller
    @users_controller = users_controller
    organizations = @organizations_controller.list
    users = @users_controller.list
    tickets = list

    search_term = @ticket_view.ask_search_term
    # rubocop:disable LineLength
    matched_results = @ticket_search.search_json_data(search_term, users, organizations, tickets)
    # rubocop:enable LineLength
    @ticket_view.list_search_results(matched_results, search_term)
  end
end

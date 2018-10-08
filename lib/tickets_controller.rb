require_relative 'ticket_view'
require_relative 'ticket_search'

# This class acts as the controller for Ticket data
class TicketsController
  def initialize(ticket_data)
    @ticket_data = ticket_data.ticket_data_hash
    @ticket_search = TicketSearch.new
    @ticket_view = TicketView.new
  end

  def list
    @ticket_data
  end

  def search(users_controller, organizations_controller)
    @organizations_controller = organizations_controller
    @users_controller = users_controller
    
    # Get search term from ticket
    search_term = @ticket_view.ask_search_term

    # Get list of all data
    organizations = @organizations_controller.list
    users = @users_controller.list
    tickets = list
    
    # Use the search term to search the data for a match
    matched_results = @ticket_search.search_json_data(search_term, users, organizations, tickets)
    
    # Display the results to the terminal
    @ticket_view.list_search_results(matched_results, search_term)
  end
end

require_relative 'view'
require_relative 'search'

# This class acts as the controller for Ticket data
class TicketsController
    def initialize(ticket_data)
        @ticket_data = ticket_data
        @view = View.new
    end

    def search
        # Get search term from ticket
        search_term = @view.ask_search_term
        # Get list of all data
        all_data = @ticket_data.data_hash
        # Use the search term to search the data for a match
        matched_results = search_json_data(search_term, all_data)
        # Display the results to the terminal
        @view.list_search_results(matched_results, search_term)
    end
end
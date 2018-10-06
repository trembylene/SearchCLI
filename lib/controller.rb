require_relative 'view'

# This class acts as the controller
class Controller
    def initialize(json_data)
        @json_data = json_data
        @view = View.new
    end

    def search
        # Get search term from user
        search_term = @view.ask_search_term
        byebug
        # Use the search term to search the data for a match
        # Display the results to the user
        # Optional: Give the user another option to show more details for results (ie click 1 for more info on 1)
    end
end
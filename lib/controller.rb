require_relative 'view'
require_relative 'search'

# This class acts as the controller
class Controller
    def initialize(json_data)
        @json_data = json_data
        @view = View.new
    end

    def search
        # Get search term from user
        search_term = @view.ask_search_term

        # Get list of all data
        all_data = @json_data.data_hash

        # Use the search term to search the data for a match
        matched_results = search_json_data(search_term, all_data)
        # byebug
        # Display the results to the user
        @view.list_search_results(matched_results, search_term)

        # Optional: Give the user another option to show more details for results (ie click 1 for more info on 1)
    end
end
require_relative '../views/user_view'
require_relative '../methods/user_search'

# This class acts as the controller for User data
class UsersController
  def initialize(user_data)
    @user_data = user_data.user_data_hash
    @user_search = UserSearch.new
    @user_view = UserView.new
  end

  def list
    @user_data
  end

  def search(organizations_controller)
    @organizations_controller = organizations_controller

    # Get search term from user
    search_term = @user_view.ask_search_term

    # Get list of all data
    organizations = @organizations_controller.list
    users = list

    # Use the search term to search the data for a match
    matched_results = @user_search.search_json_data(search_term, users, organizations)

    # Display the results to the terminal
    @user_view.list_search_results(matched_results, search_term)
  end
end

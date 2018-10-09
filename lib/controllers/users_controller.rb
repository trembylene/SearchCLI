require_relative '../views/user_view'
require_relative '../methods/user_search'

# Handling all user requests coming from the router, 
# this class acts as the controller for all User related requests,
# and coordinates connections between related files in the application.
class UsersController
  def initialize(user_data)
    # loads necessary data and initializes classes
    @user_data = user_data.user_data_hash
    @user_search = UserSearch.new
    @user_view = UserView.new
  end

  def list
    # returns all user data
    @user_data
  end

  def search(organizations_controller)
    # search method to return results to the terminal, 
    # via coordiation between necessary data, views,
    # and methods
    @organizations_controller = organizations_controller
    organizations = @organizations_controller.list
    users = list

    search_term = @user_view.ask_search_term
    # rubocop:disable LineLength
    matched_results = @user_search.search_json_data(search_term, users, organizations)
    # rubocop:enable LineLength
    @user_view.list_search_results(matched_results, search_term)
  end
end

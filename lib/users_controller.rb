require_relative 'user_view'
require_relative 'user_search'
# require_relative 'organizations_controller'

# This class acts as the controller for User data
class UsersController
  def initialize(user_data)
    @user_data = user_data.user_data_hash
    @user_view = UserView.new
  end

  def list
    # Get list of all data
    @user_data
  end

  def search(organizations_controller)
    @organizations_controller = organizations_controller
    # @tickets_controller = tickets_controller

    # Get search term from user
    search_term = @user_view.ask_search_term

    # Get list of all data
    organizations = @organizations_controller.list
    # tickets = @tickets_controller.ticket_data
    users = self.list
    


    # Use the search term to search the data for a match
    matched_results = search_json_data(search_term, users, organizations)
    # Use the 
    # Display the results to the terminal
    @user_view.list_search_results(matched_results, search_term)
  end
end

# def get_organization_data
  
# end

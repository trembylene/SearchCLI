require_relative '../views/organization_view'
require_relative '../methods/organization_search'

# This class acts as the controller for Organization data
class OrganizationsController
  def initialize(organization_data)
    @organization_data = organization_data.organization_data_hash
    @organization_search = OrganizationSearch.new
    @organization_view = OrganizationView.new
  end

  def list
    @organization_data
  end

  def search(users_controller, tickets_controller)
    @tickets_controller = tickets_controller
    @users_controller = users_controller

    # Get search term from organization
    search_term = @organization_view.ask_search_term

    # Get list of all data
    tickets = @tickets_controller.list
    users = @users_controller.list
    organizations = list

    # Use the search term to search the data for a match
    matched_results = @organization_search.search_json_data(search_term, users, organizations, tickets)
    
    # Display the results to the terminal
    @organization_view.list_search_results(matched_results, search_term)
  end
end

require_relative '../views/organization_view'
require_relative '../methods/organization_search'

# Handling all user requests coming from the router, 
# this class acts as the controller for all Organization related requests,
# and coordinates connections between related files in the application.
class OrganizationsController
  def initialize(organization_data)
    # loads necessary data and initializes classes
    @organization_data = organization_data.organization_data_hash
    @organization_search = OrganizationSearch.new
    @organization_view = OrganizationView.new
  end

  def list
    # returns all organization data
    @organization_data
  end

  def search(users_controller, tickets_controller)
    # search method to return results to the terminal, 
    # via coordiation between necessary data, views,
    # and methods
    @tickets_controller = tickets_controller
    @users_controller = users_controller
    tickets = @tickets_controller.list
    users = @users_controller.list
    organizations = list

    search_term = @organization_view.ask_search_term
    # rubocop:disable LineLength
    matched_results = @organization_search.search_json_data(search_term, users, organizations, tickets)
    # rubocop:enable LineLength
    @organization_view.list_search_results(matched_results, search_term)
  end
end

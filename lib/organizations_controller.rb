# require_relative 'view'
# require_relative 'organization_search'

# This class acts as the controller for Organization data
class OrganizationsController
  attr_accessor :search, :list

  def initialize(organization_data)
    @organization_data = organization_data
    # @view = View.new
  end

  def list
    # Get list of all data
    @organization_data.organization_data_hash
  end

  def search
    # Get search term from organization
    # search_term = @view.ask_search_term
    organizations = list
    # Use the search term to search the data for a match
    matched_results = search_json_data(search_term, all_data)
    # Display the results to the terminal
    # @view.list_search_results(matched_results, search_term)
  end
end

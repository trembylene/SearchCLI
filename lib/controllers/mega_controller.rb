require_relative '../views/mega_view'
require_relative '../methods/organization_search'
require_relative '../methods/ticket_search'
require_relative '../methods/user_search'

# Handling all user requests coming from the router,
# this class acts as the controller for all Mega related requests,
# and coordinates connections between related files in the application.
class MegaController
  def initialize
    # initializes classes
    @mega_view = MegaView.new
    @organization_search = OrganizationSearch.new
    @ticket_search = TicketSearch.new
    @user_search = UserSearch.new
  end

  def search(users_controller, tickets_controller, organizations_controller)
    # search method to return results to the terminal,
    # via coordiation between necessary data, views,
    # and methods
    @tickets_controller = tickets_controller
    @users_controller = users_controller
    @organizations_controller = organizations_controller

    tickets = @tickets_controller.list
    users = @users_controller.list
    organizations = @organizations_controller.list

    search_term = @mega_view.ask_search_term

    mega_results = []
    # rubocop:disable LineLength
    mega_results << @organization_search.search_json_data(search_term, users, organizations, tickets)
    mega_results << @ticket_search.search_json_data(search_term, users, organizations, tickets)
    mega_results << @user_search.search_json_data(search_term, users, organizations)
    # rubocop:enable LineLength
    @mega_view.list_search_results(mega_results, search_term)
  end
end

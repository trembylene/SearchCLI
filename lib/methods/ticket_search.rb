# This class acts as a search feature for Tickets, which handles data
# trawling to search for ticket matches to the users query, and data
# trawling to search for entities related to each returned match
class TicketSearch
  # rubocop:disable Metrics/MethodLength
  def search_json_data(search_term, users, organizations, tickets)
    # searches data for match to user search query
    @matched_results = []

    tickets.each do |ticket|
      ticket.values.find_all do |value|
        if value == search_term.to_i
          return_related_entities(ticket, organizations, users)
        elsif value == search_term
          return_related_entities(ticket, organizations, users)
        elsif value.is_a?(Array)
          value.each do |array_item|
            # rubocop:disable LineLength
            next unless array_item == search_term || array_item == search_term.to_i
            # rubocop:enable LineLength
            return_related_entities(ticket, organizations, users)
          end
        end
      end
    end

    @matched_results
  end
  # rubocop:enable Metrics/MethodLength

  def return_related_entities(ticket, organizations, users)
    # returns matched ticket object with any related entities
    # rubocop:disable LineLength
    ticket[:related_entities] = get_related_entities(ticket, organizations, users)
    # rubocop:enable LineLength
    @matched_results << ticket
  end

  def get_related_entities(ticket, organizations, users)
    # checks for related entities
    organizations_data = organizations
    users_data = users
    @related_entities = []

    id = ticket['organization_id']
    find_entity(id, organizations_data)

    id = ticket['submitter_id']
    find_entity(id, users_data)

    id = ticket['assignee_id']
    find_entity(id, users_data)

    @related_entities
  end

  def find_entity(id, related_entity_results)
    # returns related entities
    related_entity_results.each do |entity|
      @related_entities << entity if entity['_id'] == id
    end
  end
end

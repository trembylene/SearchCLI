# This class acts as a search feature for Organizations, which handles data
# trawling to search for organization matches to the users query, and data
# trawling to search for entities related to each returned match
class OrganizationSearch
  def search_json_data(search_term, users, organizations, tickets)
    # searches data for match to user search query
    @matched_results = []

    organizations.each do |organization|
      organization.values.find_all do |value|
        if value == search_term.to_i
          return_related_entities(organization, tickets, users)
        elsif value == search_term
          return_related_entities(organization, tickets, users)
        elsif value.is_a?(Array)
          value.each do |array_item|
            next unless array_item == search_term || array_item == search_term.to_i
            return_related_entities(organization, tickets, users)
          end
        end
      end
    end

    @matched_results
  end

  def return_related_entities(organization, tickets, users)
    # returns matched organization object with any related entities
    # rubocop:disable LineLength
    organization[:related_entities] = get_related_entities(organization, tickets, users)
    # rubocop:enable LineLength
    @matched_results << organization
  end

  def get_related_entities(organization, tickets, users)
    # checks for related entities
    tickets_data = tickets
    users_data = users
    @related_entities = []

    id = organization['ticket_id']
    find_entity(id, tickets_data)

    id = organization['user_id']
    find_entity(id, users_data)

    @related_entities
  end

  def find_entity(id, related_entity_results)
    # returns related entities
    related_entity_results.each do |entity|
      @related_entities << entity if entity['organization_id'] == id
    end
  end
end

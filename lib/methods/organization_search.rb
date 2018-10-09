class OrganizationSearch
    # rubocop:disable Metrics/MethodLength
    def search_json_data(search_term, users, organizations, tickets)
        @matched_results = []
    
        organizations.each do |organization|
            organization.values.find_all do |value|
                if value == search_term.to_i
                organization[:related_entities] = get_related_entities(organization, tickets, users)
                @matched_results << organization
                elsif value == search_term
                organization[:related_entities] = get_related_entities(organization, tickets, users)
                @matched_results << organization
                elsif value.is_a?(Array)
                value.each do |array_item|
                    next unless array_item == search_term || array_item == search_term.to_i
                        organization[:related_entities] = get_related_entities(organization, tickets, users)
                        @matched_results << organization
                    end
                end
            end
        end
    
        @matched_results
    end
    # rubocop:enable Metrics/MethodLength
    
    def get_related_entities(organization, tickets, users)
        tickets_data = tickets
        users_data = users

        @related_entities = []

        # check for ticket entities
        id = organization['ticket_id']
        find_entity(id, tickets_data)

        # check for user entities
        id = organization['user_id']
        find_entity(id, users_data)
    
        @related_entities
    end
    
    def find_entity(id, related_entity_results)
        related_entity_results.each do |entity|
            @related_entities << entity if entity['organization_id'] == id
        end
    end
end
class TicketSearch
    # rubocop:disable Metrics/MethodLength
    def search_json_data(search_term, users, organizations, tickets)
        @matched_results = []
    
        tickets.each do |ticket|
            ticket.values.find_all do |value|
                if value == search_term.to_i
                ticket[:related_entities] = get_related_entities(ticket, organizations, users)
                @matched_results << ticket
                elsif value == search_term
                ticket[:related_entities] = get_related_entities(ticket, organizations, users)
                @matched_results << ticket
                elsif value.is_a?(Array)
                value.each do |array_item|
                    next unless array_item == search_term || array_item == search_term.to_i
                        ticket[:related_entities] = get_related_entities(ticket, organizations, users)
                        @matched_results << ticket
                    end
                end
            end
        end
    
        @matched_results
    end
    # rubocop:enable Metrics/MethodLength
    
    def get_related_entities(ticket, organizations, users)
        organizations_data = organizations
        users_data = users

        @related_entities = []

        # check for organization entities
        id = ticket['organization_id']
        find_entity(id, organizations_data)
        
        # check for submitter entities
        id = ticket['submitter_id']
        find_entity(id, users_data)

        # check for assignee entities
        id = ticket['assignee_id']
        find_entity(id, users_data)
    
        @related_entities
    end
    
    def find_entity(id, related_entity_results)
        related_entity_results.each do |entity|
            @related_entities << entity if entity['_id'] == id
        end
    end
end
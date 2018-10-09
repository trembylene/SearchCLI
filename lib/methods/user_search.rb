  # rubocop:disable Metrics/MethodLength
class UserSearch
  def search_json_data(search_term, users, organizations)
    @matched_results = []

    users.each do |user|
      user.values.find_all do |value|
        if value == search_term.to_i
          user[:related_entities] = get_related_entities(user, organizations)
          @matched_results << user
        elsif value == search_term
          user[:related_entities] = get_related_entities(user, organizations)
          @matched_results << user
        elsif value.is_a?(Array)
          value.each do |array_item|
            next unless array_item == search_term || array_item == search_term.to_i
            user[:related_entities] = get_related_entities(user, organizations)
            @matched_results << user
          end
        end
      end
    end

    @matched_results
  end
  # rubocop:enable Metrics/MethodLength

  def get_related_entities(user, organizations)
    @related_entities = []

    # check for organization entities
    id = user['organization_id']

    organizations.each do |organization|
      @related_entities << organization if organization['_id'] == id
    end

    @related_entities
  end
end
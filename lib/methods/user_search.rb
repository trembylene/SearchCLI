# This class acts as a search feature for Users, which handles data
# trawling to search for user matches to the users query, and data
# trawling to search for entities related to each returned match
class UserSearch
  def search_json_data(search_term, users, organizations)
    # searches data for match to user search query
    @matched_results = []

    users.each do |user|
      user.values.find_all do |value|
        if value == search_term.to_i
          return_related_entities(user, organizations)
        elsif value == search_term
          return_related_entities(user, organizations)
        elsif value.is_a?(Array)
          value.each do |array_item|
            # rubocop:disable LineLength
            next unless array_item == search_term || array_item == search_term.to_i
            return_related_entities(user, organizations)
          end
        end
      end
    end

    @matched_results
  end
  
  def return_related_entities(user, organizations)
    # returns matched user object with any related entities
    user[:related_entities] = get_related_entities(user, organizations)
    @matched_results << user
  end

  def get_related_entities(user, organizations)
    # checks for related entities
    @related_entities = []
    id = user['organization_id']

    organizations.each do |organization|
      @related_entities << organization if organization['_id'] == id
    end

    @related_entities
  end
end

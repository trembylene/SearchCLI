# This class acts as the view for the Organization controller, which
# takes gets input from the user, and displays organization and related
# entities information to the user in readable format
class OrganizationView
  def ask_search_term
    # gets search query from user
    puts 'Please type what you would like to search for, then press enter.'
    print '> '
    gets.chomp
  end

  def list_search_results(search_results, search_term)
    # error handling for if no results found
    puts ''
    puts '*****************************************************************'
    if !search_results[0].nil?
      results_found(search_results, search_term)
    else
      results_not_found(search_term)
    end
    puts '*****************************************************************'
  end

  # rubocop:disable Metrics/MethodLength
  def results_found(search_results, search_term)
    # returns results of the search query
    puts "Your search query '#{search_term}' matches the following results: "
    search_results.each_with_index do |search_result, index|
      puts ''
      puts '**************************'
      puts '*************'
      puts "ORGANIZATION RESULT #{index + 1})"
      search_result.each do |key, value|
        if key == :related_entities
          humanize_entities(value)
        else
          humanize_result(key, value)
        end
      end
    end
    puts '**************************'
    puts ''
  end
  # rubocop:enable Metrics/MethodLength

  def results_not_found(search_term)
    # message if no results returned
    # rubocop:disable LineLength
    puts "Sorry, we found no results matching your search query '#{search_term}'"
    # rubocop:enable LineLength
  end

  def humanize_result(key, value)
    # makes data values of main result readible
    puts "#{key.capitalize}: #{value}"
  end

  def humanize_entities(entities)
    # makes data values of related results readible
    puts ''
    puts '*************'
    check_entities_present(entities)
    puts '*************'
  end

  # rubocop:disable Metrics/MethodLength
  def check_entities_present(entities)
    if !entities[0].nil?
      puts 'Here are all related entities for the above result'
      entities.each do |entity|
        puts '*****'
        entity.each do |hash_key, hash_value|
          if hash_key == :related_entities
            puts ''
          else
            puts "#{hash_key.capitalize}: #{hash_value}"
          end
        end
        puts '*****'
      end
    else
      puts 'There are no related entities for the above result'
    end
  end
  # rubocop:enable Metrics/MethodLength
end

# This class acts as the view
class UserView
  def ask_search_term
    puts 'Please type what you would like to search for, then press enter.'
    print '> '
    gets.chomp
  end

  def list_search_results(search_results, search_term)
    puts ''
    puts '*****************************************************************'
    if !search_results[0].nil?
      results_found(search_results, search_term)
    else
      results_not_found(search_term)
    end
    puts '*****************************************************************'
  end

  def results_found(search_results, search_term)
    puts "Your search query '#{search_term}' matches the following results: "
    search_results.each_with_index do |search_result, index|
      puts ''
      puts '**************************'
      puts '*************'
      puts "USER RESULT #{index + 1})"
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

  def results_not_found(search_term)
    # rubocop:disable LineLength
    puts "Sorry, we found no results matching your search query '#{search_term}'"
    # rubocop:enable LineLength
  end

  def humanize_result(key, value)
    puts "#{key}: #{value}"
  end

  def humanize_entities(entities)
    puts ''
    puts '*************'
    if !entities[0].nil?
      puts 'Here are all related entities for the above result'
      entities.each do |entity|
        puts '*****'
        entity.each do |hash_key, hash_value|
          puts "#{hash_key}: #{hash_value}"
        end
        puts '*****'
      end
    else
      puts 'There are no related entities for the above result'
    end
    puts '*************'
  end
end

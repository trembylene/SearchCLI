# This class acts as the view
class View
    def ask_search_term
        puts "Please type what you would like to search for, then press enter."
        print "> "
        gets.chomp
    end

    def list_search_results(search_results, search_term)
        puts ''
        puts '*****************************************************************'
        if search_results[0] != nil
            puts "Your search query '#{search_term}' matches the following results: "

            search_results.each_with_index do |result, index|
                puts ''
                puts '**************************'
                puts "RESULT #{index + 1})"
                humanize_result(result)
                puts '**************************'
            end
        else
            puts "Sorry, we found no results matching your search query '#{search_term}'"
        end
        puts '*****************************************************************'
    end

    def humanize_result(result)
        result.each do |key, value|
            puts "#{key.capitalize}: #{value}"
        end
    end
end
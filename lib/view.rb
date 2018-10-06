# This class acts as the view
class View
    def ask_search_term
        puts "Please type what you would like to search for"
        print "> "
        gets.chomp
    end
end
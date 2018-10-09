# This class acts as the router
class Router
  def initialize(users_controller, tickets_controller, organizations_controller, mega_controller)
    # loads required instances
    @users_controller = users_controller
    @tickets_controller = tickets_controller
    @organizations_controller = organizations_controller
    @mega_controller = mega_controller
    @running = true
  end

  def run(organizations_controller, tickets_controller, users_controller)
    # runs the whole app and displays menu
    puts '           --             '
    puts 'Welcome to the Search CLI!'
    puts '           --             '

    while @running
      display_menu
      menu_selection = gets.chomp.to_i
      print `clear`
      # rubocop:disable LineLength
      route_menu_selection(menu_selection, organizations_controller, tickets_controller, users_controller)
      # rubocop:enable LineLength
    end
  end

  private

  # rubocop:disable LineLength
  def route_menu_selection(menu_selection, organizations_controller, tickets_controller, users_controller)
    # converts user input to relevant search methods
    case menu_selection
    when 1 then @users_controller.search(organizations_controller)
    when 2 then @tickets_controller.search(users_controller, organizations_controller)
    when 3 then @organizations_controller.search(users_controller, tickets_controller)
    when 4 then @mega_controller.search(users_controller, tickets_controller, organizations_controller)
    # rubocop:enable LineLength
    when 0 then stop_program
    else
      display_selection_error
    end
  end

  def stop_program
    # turns program off
    @running = false
  end

  def display_selection_error
    # error message for invalid user input
    # rubocop:disable LineLength
    puts '*********************************************************************************'
    puts 'ERROR: Please make a valid selection by pressing 1, 2, 3, or 0, and then pressing enter.'
    puts 'All other inputs are invalid.'
    puts '*********************************************************************************'
    # rubocop:enable LineLength
  end

  # rubocop:disable Metrics/MethodLength
  def display_menu
    # menu options that are rendered to the user
    puts ''
    puts 'MENU INSTRUCTIONS: '
    puts 'Please press 1, 2, 3, or 0'
    puts ''
    puts 'MENU:'
    puts 'What do you want to do next?'
    puts '1 - Search all user data'
    puts '2 - Search all ticket data'
    puts '3 - Search all organization data'
    puts '4 - Search all data'
    puts ''
    puts '0 - Stop and exit the program'
  end
  # rubocop:enable Metrics/MethodLength
end

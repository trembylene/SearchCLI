# This class acts as the router
class Router
  def initialize(users_controller, tickets_controller, organizations_controller)
    @users_controller = users_controller
    @tickets_controller = tickets_controller
    @organizations_controller = organizations_controller
    @running = true
  end

  def run(organizations_controller, tickets_controller, users_controller)
    puts '           --             '
    puts 'Welcome to the Search CLI!'
    puts '           --             '

    while @running
      display_menu
      menu_selection = gets.chomp.to_i
      print `clear`
      route_menu_selection(menu_selection, organizations_controller, tickets_controller, users_controller)
    end
  end

  private

  def route_menu_selection(menu_selection, organizations_controller, tickets_controller, users_controller)
    case menu_selection
    when 1 then @users_controller.search(organizations_controller)
    when 2 then @tickets_controller.search(users_controller, organizations_controller)
    when 3 then @organizations_controller.search
    when 0 then stop_program
    else
      display_selection_error
    end
  end

  def stop_program
    @running = false
  end

  def display_selection_error
    # rubocop:disable LineLength
    puts '*********************************************************************************'
    puts 'ERROR: Please make a valid selection by pressing 1, 2, 3, or 0, and then pressing enter.'
    puts 'All other inputs are invalid.'
    puts '*********************************************************************************'
    # rubocop:enable LineLength
  end

  def display_menu
    puts ''
    puts 'MENU INSTRUCTIONS: '
    puts 'Please press 1, 2, 3, or 0'
    puts ''
    puts 'MENU:'
    puts 'What do you want to do next?'
    puts '1 - Search all user data'
    puts '2 - Search all ticket data'
    puts '3 - Search all organization data'
    puts '0 - Stop and exit the program'
  end
end

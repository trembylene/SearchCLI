# This class acts as the router
class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts 'Welcome to the Search CLI!'
    puts '           --             '

    while @running
      display_menu
      menu_selection = gets.chomp.to_i
      print `clear`
      route_menu_selection(menu_selection)
    end
  end

  private

  def route_menu_selection(menu_selection)
    case menu_selection
    when 1 then @controller.search
    when 0 then stop_program
    else
      puts '*********************************************************************************'
      puts 'ERROR: Please make a valid selection by pressing 1 or 0, and then pressing enter.'
      puts 'All other inputs are invalid.'
      puts '*********************************************************************************'
    end
  end

  def stop_program
    @running = false
  end

  def display_menu
    puts ''
    puts 'MENU INSTRUCTIONS: '
    puts 'Please press 1 or 0'
    puts ''
    puts 'MENU:'
    puts 'What do you want to do next?'
    puts '1 - Search all data'
    puts '0 - Stop and exit the program'
  end
end

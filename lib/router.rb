# This class acts as the router
class Router
  def initialize(controller)
    @controller = true
    @running    = true
  end

  def run
    puts 'Welcome to the Search CLI!'
    puts '           --             '

    while @running
      display_menu
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.search
    when 0 then stop
    else
      puts 'Please press 1 or 0'
    end
  end

  def stop
    @running = false
  end

  def display_menu
    puts ''
    puts 'What do you want to do next?'
    puts '1 - Search all data'
    puts '0 - Stop and exit the program'
  end
end

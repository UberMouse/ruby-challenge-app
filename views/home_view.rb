class HomeView

  def initialize(writer)
    @writer = writer
  end

  def run
    @writer.print_line 'Welcome to Ruby Challenger'
    @writer.print_on_same_line 'Please enter your command > '

    input = gets.chomp
    @writer.clear_screen
    input
  end
end
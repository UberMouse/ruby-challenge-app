class HomeView

  # @param [ConsoleWriter] writer
  def initialize(writer)
    @writer = writer
  end

  # @return [String] user input
  def run
    @writer.print_line 'Welcome to Ruby Challenger'
    @writer.print_on_same_line 'Please enter your command > '

    input = gets.chomp
    @writer.clear_screen
    input
  end
end
class HomeView

  # @param [ConsoleWriter] writer
  def initialize(writer)
    @writer = writer
  end

  # @return [String] user input
  def run(arguments)

    good_command_message = 'Please enter your command > '
    command_entry_message = arguments[:bad_command_message] || good_command_message
    @writer.print_line "______________________________________
------\e[4mWELCOME TO RUBY CHALLENGER\e[0m------

\n-Press \e[4mq\e[0m to begin\n-Enter \e[4mquit\e[0m to exit\n "
    @writer.print_on_same_line command_entry_message

    input = gets.chomp
    @writer.clear_screen
    input
  end
end

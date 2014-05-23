class HomeView

  # @param [ConsoleWriter] writer
  def initialize(writer)
    @writer = writer
  end

  # @return [String] user input
  def run(arguments)

    good_command_message = 'Please enter your command > '
    command_entry_message = arguments[:bad_command_message] || good_command_message
    @writer.print_line "\e[93m______________________________________\e[0m
\e[93m------\e[0m\e[93m\e[4mWELCOME TO \e[95mRUBY\e[0m\e[0m\e[93m\e[4m CHALLENGER\e[0m\e[0m\e[93m------\e[0m

\e[93m-Press \e[95m\e[4mq\e[0m\e[0m\e[93m to begin\n-Enter \e[95m\e[4mquit\e[0m\e[0m\e[93m to exit\n \e[0m"
    @writer.print_on_same_line command_entry_message

    input = gets.chomp
    @writer.clear_screen
    input
  end
end

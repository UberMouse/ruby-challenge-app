class IncorrectQuestionView

  # @param [ConsoleInterface] writer
  def initialize(writer)
    @writer = writer
  end

  # @return [String] first character of user input converted to lowercase
  def run(arguments)
    bad_command_message = arguments[:bad_command_message]

    @writer.print_line 'Oh noes! You got the question wrong.'

    @writer.print_line 'What would you like to do?'
    @writer.print_line '[R]etry'
    @writer.print_line '[N]ext Question?'
    @writer.print_line 'Go back to [H]ome'

    unless bad_command_message.nil?
      @writer.print_on_same_line bad_command_message
    end

    input = @writer.get_char
    @writer.clear_screen
    input
  end
end
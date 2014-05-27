require 'highline/system_extensions'

class CorrectQuestionView
  # @param [ConsoleInterface] writer
  def initialize(writer)
    @writer = writer
  end

  # @param [Hash] arguments
  # @return [String] first character of user input converted to lowercase
  def run(arguments)
    question = arguments[:question]
    answer = arguments[:answer]
    bad_command_message = arguments[:bad_command_message]

    @writer.print_line 'Congratulations! You got the question correct.'
    @writer.print_line question
    @writer.print_line "Your answer: #{answer}"

    @writer.print_line 'What would you like to do?'
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

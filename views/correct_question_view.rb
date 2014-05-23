require 'highline/system_extensions'

class CorrectQuestionView
  # @param [ConsoleWriter] writer
  def initialize(writer)
    @writer = writer
  end

  # @param [Hash] arguments
  # @return [String] first character of user input converted to lowercase
  def run(arguments)
    question = arguments[:question]
    answer = arguments[:answer]

    @writer.print_line 'Congratulations! You got the question correct.'
    @writer.print_line question
    @writer.print_line "Your answer: #{answer}"

    @writer.print_line 'What would you like to do?'
    @writer.print_line '[N]ext Question?'
    @writer.print_line 'Go back to [H]ome'

    input = gets.chomp
    @writer.clear_screen
    input.chars[0].downcase
  end
end
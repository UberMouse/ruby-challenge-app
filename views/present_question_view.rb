class PresentQuestionView

  # @param [ConsoleInterface] writer
  def initialize(writer)
    @writer = writer
  end

  # @param [Hash] arguments
  # @return [String] user input
  def run(arguments)
    question = arguments[:question]

    @writer.print_line 'What will this function output?'
    @writer.print_line question
    @writer.print_on_same_line '> '

    input = @writer.get_line
    @writer.clear_screen
    input
  end

end
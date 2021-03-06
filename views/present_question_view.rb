class PresentQuestionView

  # @param [ConsoleWriter] writer
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

    input = gets.chomp
    @writer.clear_screen
    input
  end

end
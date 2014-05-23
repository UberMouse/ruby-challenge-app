class IncorrectQuestionView

  # @param [ConsoleWriter] writer
  def initialize(writer)
    @writer = writer
  end

  # @return [String] first character of user input converted to lowercase
  def run
    @writer.print_line 'Oh noes! You got the question wrong.'

    @writer.print_line 'What would you like to do?'
    @writer.print_line '[R]etry'
    @writer.print_line '[N]ext Question?'
    @writer.print_line 'Go back to [H]ome'

    input = gets.chomp
    @writer.clear_screen
    input.chars[0].downcase
  end
end
class AddContentConfirmationView
  # @param [ConsoleWriter] writer
  def initialize(writer)
    @writer = writer
  end

  # @param [Hash] arguments
  # @return [String] first character of user input converted to lowercase
  def run(arguments)
    
    question = arguments[:add_question]
    answer = arguments[:add_answer]

    @writer.print_line 'Thank you for adding a Ruby Challenger question!'
    @writer.print_line 'Please confirm this is what you intended:'
    @writer.print_line question
    @writer.print_line 'For which Ruby Challenger expects this answer:'
    @writer.print_line answer
 
    @writer.print_line '[C]onfirm'
    @writer.print_line 'Back to [H]ome'

    input = gets.chomp
    @writer.clear_screen
    input.chars[0].downcase

  end
end
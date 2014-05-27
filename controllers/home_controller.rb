class HomeController

  # @param [Hash] ignored_arguments
  # @param [Class] view
  def home(ignored_arguments, view)
    input = view.run({})

    arguments = {add_question: input.split(' ')[1..-1].join(' ')}
    input = input.split[0]

    valid_commands = %w(q add)
    exit_commands = %w(quit exit)

    until valid_commands.include? input or exit_commands.include? input
      view_arguments = {
        bad_command_message: "'#{input}' was not a valid command, please try again > "
      }
      input = view.run view_arguments
    end

    if exit_commands.include? input
      return :command => :quit
    end

    case input
      when 'q'
        return :command => :present_question
      when 'add'
        return arguments.merge(command: :add_content)
      when 'quit'
        return :command => :quit
    end
  end

end
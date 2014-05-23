class HomeController

  # @param [Router] router
  def initialize(router)
    @router = router
  end

  # @param [Hash] ignored_arguments
  # @param [Class] view
  def home(ignored_arguments, view)
    input = view.run({})

    valid_commands = %w(q)
    exit_commands = %w(quit exit)

    until valid_commands.include? input or exit_commands.include? input
      view_arguments = {
        bad_command_message: "'#{input}' was not a valid command, please try again > "
      }
      input = view.run view_arguments
    end

    if exit_commands.include? input
      @router.goto :quit
    end

    case input
      when 'q'
        @router.goto :present_question
    end
  end

  def quit(ignored_arguments, ignored_view)
    exit(0)
  end
end
class QuestionsController

  # @param [Router] router
  def initialize(router, eval, snippet_service)
    @router = router
    @eval = eval
    @snippet_service = snippet_service
  end
  # @param [Hash] arguments
  # @param [Class] view
  def present(arguments, view)
    question = arguments[:question] || @snippet_service.get_random[:method_text]

    view_arguments = {
        question: question
    }

    input = view.run view_arguments

    answer = @eval.eval_safe(question)
    correct = @eval.eval_safe(input) == answer
    # binding.pry
    next_router_arguments = {
        question: question,
        answer: answer
    }

    if correct
      @router.goto :correct_question, next_router_arguments
    else
      @router.goto :incorrect_question, view_arguments
    end
  end

  # @param [Hash] arguments
  # @param [Class] view
  def correct(arguments, view)
    question = arguments[:question]
    answer = arguments[:answer]

    view_arguments = {
        question: question,
        answer: answer
    }

    valid_commands = %w(h n)

    input = view.run view_arguments

    until valid_commands.include? input
      bad_command_message = {
          bad_command_message: "#{input} was not a valid command, please try again > "
      }

      input = view.run(view_arguments.merge bad_command_message)
    end

    case input
      when 'h'
        @router.goto :home
      when 'n'
        @router.goto :present_question
      else
        raise 'badd command'
    end
  end

  # @param [Hash] arguments
  # @param [Class] view
  def incorrect(arguments, view)
    input = view.run({})

    valid_commands = %w(h n r)

    until valid_commands.include? input
      bad_command_message = {
          bad_command_message: "#{input} was not a valid command, please try again > "
      }

      input = view.run bad_command_message
    end

    case input
      when 'h'
        @router.goto :home
      when 'r'
        @router.goto(:present_question, arguments)
      when 'n'
        @router.goto :present_question
      else
        raise 'badd command'
    end
  end


end
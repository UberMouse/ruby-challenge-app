class QuestionsController

  def initialize(eval, snippet_service)
    @eval = eval
    @snippet_service = snippet_service
  end

  # @param [Hash] arguments
  # @param [Class] view
  def present(arguments, view)

    question = arguments[:question]
    if question == nil 
      question = @snippet_service.get_random[:method_text] 
    end

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
      next_router_arguments.merge(command: :correct_question)
    else
      view_arguments.merge(command: :incorrect_question)
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
        return :command => :home
      when 'n'
        return :command => :present_question
    end
  end

  # @param [Hash] arguments
  # @param [Class] view
  def incorrect(arguments, view)

    input = view.run arguments

    valid_commands = %w(h n r)

    until valid_commands.include? input
      bad_command_message = {
          bad_command_message: "#{input} was not a valid command, please try again > "
      }

      input = view.run bad_command_message
    end

    case input
      when 'h'
        return :command => :home
      when 'r'
        return arguments.merge(command: :present_question)
      when 'n'
        return :command => :present_question
    end
  end

end
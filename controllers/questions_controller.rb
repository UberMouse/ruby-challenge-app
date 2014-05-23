require_relative '../database/database'

class QuestionsController

  # @param [Router] router
  def initialize(router)
    @router = router
  end

  # @param [Hash] arguments
  # @param [Class] view
  def present(arguments, view)
    question = arguments[:question] || Database.get[:method_text]

    view_arguments = {
        question: question
    }

    input = view.run view_arguments

    answer = eval_question(question)
    correct = eval_answer(input) == answer

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

private

  # Evals input in a separate thread with $SAFE set to 4
  # @param [String] input
  # @return [String] eval'd input
  def eval_answer(input)
    execution_limit = 2

    answer = ''
    eval_thread = Thread.new {
      $SAFE = 4
      answer = eval(input)
    }

    start_time = Time.now
    while eval_thread.alive? and Time.now - start_time < execution_limit
      sleep 0.1
    end

    if eval_thread.alive?
      eval_thread.terminate
    end

    answer
  end

  # @param [String] question
  # @return [String] eval'd question
  def eval_question(question)
    eval(question)
  end
end
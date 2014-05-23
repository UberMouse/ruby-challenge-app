require_relative '../database/database'

class QuestionsController

  # @param [Router] router
  def initialize(router, eval)
    @router = router
    @eval = eval
  end

  # @param [Hash] arguments
  # @param [Class] view
  def present(arguments, view)
    question = arguments[:question] || Database.get[:method_text]

    view_arguments = {
        question: question
    }

    input = view.run view_arguments

    answer = @eval.eval_safe(question)
    correct = @eval.eval_safe(input) == answer

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

    input = view.run view_arguments

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
    input = view.run

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
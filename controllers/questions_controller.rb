require_relative '../database/database'

class QuestionsController

  def initialize(router)
    @router = router
  end

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

private

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

  def eval_question(question)
    eval(question)
  end
end
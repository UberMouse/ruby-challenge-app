require_relative '../database/database'

class AddContentController

  # @param [Router] router
  def initialize(router, my_eval)
    @router = router
    @my_eval = my_eval
  end

  # @param [Hash] arguments
  # @param [Class] view
  def add(arguments, view)

    arguments[:add_answer] = @my_eval.eval_safe(arguments[:add_question])

    input = view.run arguments

    case input.downcase
      when 'c'        
        @router.goto :home
      when 'h'
        @router.goto :home
      else
        raise 'badd addd command'
    end

  end

end
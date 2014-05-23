require_relative '../database/database'

class AddContentController

  # @param [Router] router
  def initialize(router, my_eval, snippet_service)
    @router = router
    @my_eval = my_eval
    @snippet_service = snippet_service
  end

  # @param [Hash] arguments
  # @param [Class] view
  def add(arguments, view)

    arguments[:add_answer] = @my_eval.eval_safe(arguments[:add_question])

    input = view.run arguments

    case input.downcase
      when 'c'     
       
        @snippet_service.insert arguments[:add_question]  

        @router.goto :home
      when 'h'
        @router.goto :home
      else
        raise 'badd addd command'
    end

  end

end
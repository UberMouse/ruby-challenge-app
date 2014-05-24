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

        @snippet_service.insert arguments[:add_question] 
         
        return :command => :home
      when 'h'
        return :command => :home
    end

  end

end
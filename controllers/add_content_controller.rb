class AddContentController

  def initialize(eval, snippet_service)
    @eval = eval
    @snippet_service = snippet_service
  end

  # @param [Hash] arguments
  # @param [Class] view
  def add(arguments, view)

    arguments[:add_answer] = @eval.eval_safe(arguments[:add_question])

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
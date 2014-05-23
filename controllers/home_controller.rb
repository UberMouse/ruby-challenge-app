class HomeController

  def initialize(router)
    @router = router
  end

  def home(ignored_arguments, view)
    input = view.run

    unless input == 'questions' or input == 'quit'
      raise 'invalid command'
    end

    if input == 'quit'
      @router.goto :quit
    end

    @router.goto :present_question
  end

  def quit(ignored_arguments, ignored_view)
    exit(0)
  end
end
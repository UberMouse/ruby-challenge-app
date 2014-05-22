class HomeController

  def home(router, view)
    input = view.run

    unless input == 'questions'
      raise 'invalid command'
    end

    router.goto :questions
  end
end
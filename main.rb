require 'bundler/setup'
require_relative 'router'
require_relative 'controllers/home_controller'
require_relative 'controllers/questions_controller'
require_relative 'controllers/add_content_controller'
require_relative 'views/console_writer'
require_relative 'views/home_view'
require_relative 'views/correct_question_view'
require_relative 'views/incorrect_question_view'
require_relative 'views/present_question_view'
require_relative 'views/add_content_confirmation_view'
require_relative 'eval'
require 'pry'
require 'pry-byebug'

class Bootstrapper
  def initialize
    @router = Router.new

    initialize_routes @router
  end

  def initialize_routes(router)
    home_controller = HomeController.new(router)
    my_eval = Eval.new
    questions_controller = QuestionsController.new(router, my_eval)
    add_content_controller = AddContentController.new(router, my_eval)
    writer = ConsoleWriter.new

    router.register_route(:home, home_controller, :home, HomeView.new(writer))
    router.register_route(:present_question, questions_controller, :present, PresentQuestionView.new(writer))
    router.register_route(:correct_question, questions_controller, :correct, CorrectQuestionView.new(writer))
    router.register_route(:incorrect_question, questions_controller, :incorrect, IncorrectQuestionView.new(writer))
    router.register_route(:add_content, add_content_controller, :add, AddContentConfirmationView.new(writer))

    router.register_route(:quit, home_controller, :quit, nil)
  end

  def run
    @router.goto :home
  end
end

app = Bootstrapper.new
app.run
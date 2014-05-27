require 'bundler/setup'
require_relative 'router'
require_relative 'controllers/home_controller'
require_relative 'controllers/questions_controller'
require_relative 'controllers/add_content_controller'

require_relative 'views/console_interface'
require_relative 'views/home_view'
require_relative 'views/correct_question_view'
require_relative 'views/incorrect_question_view'
require_relative 'views/present_question_view'
require_relative 'views/add_content_confirmation_view'

require_relative 'services/snippet_data_service'
require_relative 'services/snippet_service'
require_relative 'eval'
require 'pry'
require 'pry-byebug'

class Bootstrapper
  def initialize
    @router = Router.new

    initialize_routes @router
  end

  def initialize_routes(router)
    snippet_service = SnippetService.new SnippetDataService.new('methods.db', :methods)

    home_controller = HomeController.new
    eval = Eval.new
    questions_controller = QuestionsController.new(eval, snippet_service)
    add_content_controller = AddContentController.new(eval, snippet_service)
    writer = ConsoleInterface.new

    router.register_route(:home, home_controller, :home, HomeView.new(writer))
    router.register_route(:present_question, questions_controller, :present, PresentQuestionView.new(writer))
    router.register_route(:correct_question, questions_controller, :correct, CorrectQuestionView.new(writer))
    router.register_route(:incorrect_question, questions_controller, :incorrect, IncorrectQuestionView.new(writer))
    router.register_route(:add_content, add_content_controller, :add, AddContentConfirmationView.new(writer))
  end

  def run
    next_command = {:command=>:home}
    until next_command[:command] == :quit
      next_command = @router.goto next_command
    end
  end
end

app = Bootstrapper.new
app.run
require 'bundler/setup'
require_relative 'router'
require_relative 'controllers/home_controller'
require_relative 'views/console_writer'
require_relative 'views/home_view'

class Bootstrapper
  def initialize
    @router = Router.new

    initialize_routes @router
  end

  def initialize_routes(router)
    home_controller = HomeController.new
    writer = ConsoleWriter.new

    router.register_route(:home, home_controller, :home, HomeView.new(writer))
  end

  def run
    @router.goto :home
  end
end

app = Bootstrapper.new
app.run
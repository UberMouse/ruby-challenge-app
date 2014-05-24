# Handles route registration and route browsing
class Router

  class RouteNotFound < Exception
  end

  def initialize
    @controllers = {}
    @routes = {}
  end

  # Registers a route with the Router for a specific controller method
  #
  # @param location [Symbol] name to refer to this route by
  # @param controller [Class] instance of controller class this route refers to
  # @param method [Symbol] method name on controller this route should call
  # @param view [Class] instance of the view class that the controller should render with
  # @return void
  def register_route(location, controller, method, view)
    controller_sym = controller.class.name.to_sym
    @controllers[controller_sym] = controller
    @routes[location.to_sym] = ->(route_args) {
      controller = @controllers[controller_sym]
      controller.send(method, route_args, view)
    }
  end

  # Runs a previously registered controller route
  #
  # @param route_identifier [Symbol] location that route was registered as
  # @param route_args [Hash] passed to controller method when route is run, defaults to empty hash
  # @raise [RouteNotFound] if there is not route registered for route_identifier
  # @return void
  def goto(command_line)

    route_args = command_line.dup
    route_identifier = route_args.delete(:command)

    unless @routes.has_key? route_identifier
      raise RouteNotFound, "Route for: #{route_identifier} was not found"
    end

    @routes[route_identifier].call command_line
  end
end
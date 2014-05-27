class DummyView

  attr_accessor :view_args

  def initialize(return_value)
    @return_value = return_value
  end

  def run(args)
    @view_args = args
    @return_value
  end
end

require 'minitest/autorun'
require_relative '../../controllers/home_controller'

class DummyView

  def initialize(return_value)
    @return_value = return_value
  end

  def run(ignored_args)
    @return_value
  end
end

describe HomeController do

  before do
    @controller = HomeController.new
  end

  describe 'when given a quit command' do
    it 'should indicate the application should exit' do
      @controller.home({}, DummyView.new('quit')).must_equal :command => :quit
    end
  end

  describe 'when given a navigation command' do
    it 'should indicate the application should go to the questions view when given the questions command' do
      @controller.home({}, DummyView.new('q')).must_equal :command => :present_question
    end

    it 'should correctly parse arguments and indicate application should go to add content view when given add command' do
      @controller.home({}, DummyView.new('add 1 + 1')).must_equal({
        command:  :add_content,
        add_question: '1 + 1'
      })
    end
  end
end
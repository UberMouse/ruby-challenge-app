require 'minitest/autorun'
require_relative 'dummy_view'
require_relative '../../controllers/add_content_controller'
require_relative '../../eval'
require 'pry'
require 'pry-byebug'

SNIPPET = "['a', 'b'].concat('c')"
ANSWER = "['a', 'b', 'c']"

class DummySnippetService
  attr_reader :snippet

  def insert(snippet)
    @snippet = snippet
  end
end

describe AddContentController do
  before do
    @snippet_service = DummySnippetService.new
    @controller = AddContentController.new(Eval.new, @snippet_service)
  end

  describe 'adding content' do

    it 'can add a new method_text to the snippet service' do
      @controller.add({add_question: SNIPPET}, DummyView.new('c'))
      @snippet_service.snippet.must_equal SNIPPET
    end

    it 'correctly passes the evaluated question to the view' do
      view = DummyView.new('c')
      @controller.add({add_question: SNIPPET}, view)
      view.view_args.must_equal add_answer: ANSWER
    end
  end

  describe 'routing' do
    it 'directs you to the home view when you enter the home command' do
      @controller.add({add_question: ''}, DummyView.new('h')).must_equal(:command => :home)
    end
  end
end

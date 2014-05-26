require 'minitest/autorun'
require_relative '../../controllers/questions_controller'
require_relative '../../eval'
require_relative '../../models/snippet'
require_relative 'dummy_view'

SNIPPET = '[1, 2, 3].slice(2)'
ANSWER = '3'

class DummySnippetService
  def get_random
    Snippet.new(SNIPPET)
  end
end

describe QuestionsController do
  before do
    @controller = QuestionsController.new(Eval.new, DummySnippetService.new)
  end

  describe 'when given the correct answer to a presented question' do
    it 'should indicate the application should go to correct questions view with the presented question as arguments' do
      @controller.present({}, DummyView.new(ANSWER)).must_equal({
        command: :correct_question,
        question: SNIPPET,
        answer: eval(SNIPPET)
      })
    end
  end

  describe 'when given an incorrect answer to the presented question' do
    it 'should indicate the application should go to the incorrect questions view with the presented question as arguments' do
      @controller.present({}, DummyView.new('')).must_equal({
          command: :incorrect_question,
          question: SNIPPET,
      })
    end
  end

  describe 'the argument passed to the present view' do
    it 'should contain the question' do
      view = DummyView.new(ANSWER)
      @controller.present({}, view)
      view.view_args.must_equal question: SNIPPET
    end
  end

  describe 'the arguments passed to the incorrect questions view' do
    it 'should contain the question' do
      view = DummyView.new('h')
      @controller.incorrect({question: SNIPPET}, view)
      view.view_args.must_equal question: SNIPPET
    end
  end

  describe 'the arguments passed to the correct questions view' do
    it 'should contain the question and answer' do
      view = DummyView.new('h')
      @controller.correct({question: SNIPPET, answer: ANSWER}, view)
      view.view_args.must_equal({
         question: SNIPPET,
         answer: ANSWER
      })
    end
  end

  describe 'how it responds to commands in the correct view' do
    it 'should indicate the application should go to home when given the home command' do
      @controller.correct({}, DummyView.new('h')).must_equal :command => :home
    end

    it 'should indicate the application should go to present question when given the next command' do
      @controller.correct({}, DummyView.new('n')).must_equal :command => :present_question
    end
  end

  describe 'how it responds to commands in the incorrect view' do
    it 'should indicate the application should go to home when given the home command' do
      @controller.incorrect({}, DummyView.new('h')).must_equal :command => :home
    end

    it 'should indicate the application should go to present question when given the next command' do
      @controller.incorrect({}, DummyView.new('n')).must_equal :command => :present_question
    end

    it 'should indicate the application should go to present question with the current question as arguments when given the retry command' do
      @controller.incorrect({question: SNIPPET}, DummyView.new('r')).must_equal({
        command: :present_question,
        question: SNIPPET
      })
    end
  end

  describe "when given a question in it's arguments" do
    it 'should let you do that question again' do
      class DummySnippetService
        def get_random
          nil
        end
      end

      view = DummyView.new('2')
      question = '1 + 1'
      @controller.present({question: question}, view)
      view.view_args.must_equal question: question
    end
  end
end

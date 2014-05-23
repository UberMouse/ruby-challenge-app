require_relative '../models/snippet'

class SnippetService

  def initialize(snippet_data_service)
    @data_service = snippet_data_service
    @snippets = @data_service.all.shuffle
  end

  def get_random
    @snippets.shift
  end

  def insert(snippet_text)
    snippet = Snippet.new(snippet_text)
    @data_service.insert(snippet)
  end
end
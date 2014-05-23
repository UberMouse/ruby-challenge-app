class SnippetService

  def initialize(snippet_data_service)
    @data_service = snippet_data_service
    @snippets = @data_service.all.shuffle
  end

  def get_random
    @snippets.shift
  end
end
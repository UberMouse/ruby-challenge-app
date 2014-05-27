require 'sequel'
require_relative '../models/snippet'

class SnippetDataService

  # @param [String] db_name
  # @param [Symbol] table_sym
  def initialize(db_name, table_sym)
    @db = Sequel.sqlite(db_name)
    @table = @db[table_sym]
  end

  # @param [Snippet] snippet
  def insert(snippet)
    @table.insert(method_text: snippet.text)
  end

  def all
    @table.all.map do |method|
      Snippet.new(method[:method_text])
    end
  end
end
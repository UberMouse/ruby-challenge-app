require 'sequel'

class Database
  def initialize(db_name)
    @db = Sequel.sqlite('methods.db')
  end

  def get_random
    methods = @db[:methods]
    methods.all.sample
  end
end
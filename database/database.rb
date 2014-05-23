require 'sequel'

class Database
  @@db = Sequel.sqlite('methods.db')

  def self.get
    methods = @@db[:methods]
    methods.all.sample
  end
end
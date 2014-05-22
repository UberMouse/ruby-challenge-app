class Database
  @@db = Sequel.sqlite('methods.db')

  def self.get(id)
    methods = @@db[:methods]
    methods.all.find{|m| m.id == id}
  end
end
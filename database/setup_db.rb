require 'sequel'

db = Sequel.sqlite('methods.db')

db.create_table? :methods do
  primary_key :id, :autoincrement => true
  String :method_text
end

methods = db[:methods]
methods.insert(:method_text => '1 + 1')
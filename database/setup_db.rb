require 'sequel'

db = Sequel.sqlite('methods.db')

db.create_table! :methods do
  primary_key :id, :autoincrement => true
  String :method_text
end

methods = db[:methods]
methods.insert(:method_text => '[1, 2, 3, 4].reduce(0) {|result, n| result += n}')
methods.insert(:method_text => '"George went to the supermarket to get the stuff".match(/the/).to_s')
methods.insert(:method_text => '["joe", "hannah", "jill", "alex"].select{|name| name.start_with? "a"}')
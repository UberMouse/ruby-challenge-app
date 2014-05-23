require 'sequel'

db = Sequel.sqlite('methods.db')

db.create_table! :methods do
  primary_key :id, :autoincrement => true
  String :method_text
end

methods = db[:methods]
#string methods
methods.insert(:method_text => 'string = " " !string')
methods.insert(:method_text => 'var = "piglet" !!var')
methods.insert(:method_text => 'string = "Taylor skates real good" string.count "aeiou"')
methods.insert(:method_text => 'string = "Engineering Empathy" string.downcase')
methods.insert(:method_text => 'string = "Engineering Empathy" string.delete "aieou"')
methods.insert(:method_text => 'var = "piglet" var.gsub(/([aeiou])/, "*")')
methods.insert(:method_text => 'var = "piglet" var.index(/([aeiou])/)')
methods.insert(:method_text => 'var = "piglet" var.match(/([aeiou])/)')
methods.insert(:method_text => 'var = "piglet" var.prepend("Wassup")')
methods.insert(:method_text => 'var = "piglet" var.reverse')
methods.insert(:method_text => 'var = "pig" var.partition(/([aeiou])/)')
methods.insert(:method_text => 'var = piglet var.slice(2..4)')
methods.insert(:method_text => 'var = piglet var.slice(1,4)')
methods.insert(:method_text => 'var = piglet var.to_sym')
methods.insert(:method_text => 'var = piglet var.split(' ')')
	#do not randomise
methods.insert(:method_text => '"RubyChallenger".casecmp')
methods.insert(:method_text => '"RubyChallenger".swapcase')
methods.insert(:method_text => '"coffee".center(10, "**")')

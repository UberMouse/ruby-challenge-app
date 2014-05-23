require 'sequel'

db = Sequel.sqlite('methods.db')

db.create_table! :methods do
  primary_key :id, :autoincrement => true
  String :method_text
end

methods = db[:methods]
# #string methods
# methods.insert(:method_text => '! " "')
# methods.insert(:method_text => '!!"piglet"')
# methods.insert(:method_text => '"Taylor skates real good".count "aeiou"')
# methods.insert(:method_text => '"Engineering Empathy".downcase')
# methods.insert(:method_text => '"Engineering Empathy".delete "aieou"')
# methods.insert(:method_text => '"piglet".gsub(/([aeiou])/, "*")')
# methods.insert(:method_text => '"piglet".index(/([aeiou])/)')
# methods.insert(:method_text => '"piglet".match(/([aeiou])/)')
# methods.insert(:method_text => '"piglet".prepend("Wassup")')
# methods.insert(:method_text => '"piglet".reverse')
# methods.insert(:method_text => '"pig".partition(/([aeiou])/)')
# methods.insert(:method_text => '"piglet".slice(2..4)')
# methods.insert(:method_text => '"piglet".slice(1,4)')
# methods.insert(:method_text => '"piglet".to_sym')
# methods.insert(:method_text => '"piglet".split(' ')')
# 	#do not randomise
# methods.insert(:method_text => '"RubyChallenger".casecmp')
# methods.insert(:method_text => '"RubyChallenger".swapcase')
# methods.insert(:method_text => '"coffee".center(10, "**")')
methods.insert(:method_text => '[1, 2, 3, 4].reduce(0) {|result, n| result += n}')
methods.insert(:method_text => '"George went to the supermarket to get the stuff".match(/the/).to_s')
methods.insert(:method_text => '["joe", "hannah", "jill", "alex"].select{|name| name.start_with? "a"}')


#array methods
# methods.insert(:method_text => '[1,4,5,7] + [5,6,8]')
# methods.insert(:method_text => '[1, 2] << "c" << [4,5]')
# methods.insert(:method_text => '[1,2,3,4].collect{ |x| x + 3 }')
# methods.insert(:method_text => '["Brian", "Peter", "Stewie"].collect{ |x| x + "!"}')
# methods.insert(:method_text => '[1,2,3].combination(2).to_a')
# methods.insert(:method_text => '["a", nil, "b", nil, nil, "c"].compact!')
# methods.insert(:method_text => '["a", "b", "c"].concat( ["1","2","3"])')
# methods.insert(:method_text => '["a", "b", "c"].concat( [1,2,3])')
# methods.insert(:method_text => '[1,2,3,4,3].count{ |x| x%2==0}')
# methods.insert(:method_text => '[1,2].cycle(2) {|x| x }')
# methods.insert(:method_text => '["a", "b", "c", "d"].delete("b")')
# methods.insert(:method_text => '["a", "b", "c", "d"].delete_if{|x| x >= "b"}')
# methods.insert(:method_text => '[1,2,3,4,5,6,7].drop(3)')
# methods.insert(:method_text => '[0,1,2,4,3,5,6].fetch(3)')
# methods.insert(:method_text => '[1,2,3].fill("x")')
# methods.insert(:method_text => '["a","b","c"].index("b")')
# methods.insert(:method_text => '[4,5,6,7,7].first(2)')
# methods.insert(:method_text => '[1,2,3,4,5,6,7,8].replace(["a","b","c"])')
# methods.insert(:method_text => '["a","b","c"].join("-")')
# methods.insert(:method_text => '[1,2,3,4].map{ |x| x + 2 }')
# methods.insert(:method_text => '[1,2,3,4,5].pop')
# methods.insert(:method_text => '["a","b","c","d"].pop(2)')
# methods.insert(:method_text => '[1,2,3].push([4,5,6])')
# methods.insert(:method_text => '["c","b","a"].reverse!')
# methods.insert(:method_text => '["a","b","c","d"].rotate!(2)')
# methods.insert(:method_text => '["a","b","c","d"].shift')
# methods.insert(:method_text => '["a","b","c","d"].shift(2)')
# methods.insert(:method_text => '["a","b","c","d"].slice!(3)')
# methods.insert(:method_text => '[4,5,7,2,4,6,2,4,6,7,8].sort!')
# methods.insert(:method_text => '[1,2,3,3,4].sort { |x,y| y<=>x}')
# methods.insert(:method_text => '[4,5,7,2,4,6,2].take(3)')
# methods.insert(:method_text => '[[1,2], [3,4], [5,6]].transpose')
# methods.insert(:method_text => '[4,5,7,2,4,6,2,4,6,7,8].uniq!')
# methods.insert(:method_text => '["b","c","d"].unshift("a")')
# methods.insert(:method_text => '[1,2,3] | [4,5,6]')


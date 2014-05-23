!
!!
.count "aeiou"
.downcase
.delete "aieou"
.gsub(/([aeiou])/, "*")
.index(/([aeiou])/)
.match(/([aeiou])/)
.scan(/([aeiou])/) {|match| match.gsub(*)}
.prepend("Wassup")
.reverse
.partition(/([aeiou])/)
.slice(2..4)
.slice(2,5)
.to_sym
.split(' ')

-------------Do-Not_Randomise------------
"RubyChallenger".casecmp
"RubyChallenger".swapcase
"coffee".center(10, "**")


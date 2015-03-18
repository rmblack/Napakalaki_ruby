# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'Prize'
require_relative 'TreasureKind'
require_relative 'BadConsequence'
require_relative 'Monster.rb'

puts "Prize testing"
prize1 = Prize.new(1,2)
puts "treasures: " + prize1.treasures.to_s()
puts "levels: " + prize1.levels.to_s()

puts "TreasureKind testing"
puts "SHOE kind: " + TreasureKind::SHOE.to_s()

puts "BC Testing"
bc1 = BadConsequence.new()
puts "text: " + bc1.text
puts "levels: " + bc1.levels
puts "nHidden: " + bc1.nHiddenTreasures
puts "nVisible: " + bc1.nVisibleTreasures
puts "death: " + bc1.death.to_s()

puts "Monster Testing"
monster1 = Monster.new()
monster1.prize = prize1
monster1.badJuju = bc1
puts "Name: " + monster1.name
puts "prize: " + monster1.prize.treasures.to_s() + ", " + monster1.prize.levels.to_s()

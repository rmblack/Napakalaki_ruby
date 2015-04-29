#encoding: UTF-8

class Monster
  # Attributes
  def initialize (name, combatLevel, prize, badJuju)
    @name = name
    @combatLevel = combatLevel
    @prize = prize
    @badJuju = badJuju
  end
  
  attr_accessor :name, :combatLevel, :prize, :badJuju
  
  # Functions
  def to_s
    "Name = \"#{name}\"\nCombat Level = #{combatLevel}" + 
     "\nPrize: " + prize.to_s() + "\nBad Juju: " + badJuju.to_s()
    
  end
end

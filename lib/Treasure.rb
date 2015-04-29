#encoding UTF-8
# REV
  
class Treasure
  
  def initialize(text, gold, min, max, kind)
    @name = text      # string
    @goldCoins = gold # int
    @minBonus = min   # int
    @maxBonus = max   # int
    @type = kind      # TreasureKind
  end
  
  attr_reader :name, :goldCoins , :minBonus, :maxBonus, :type

  def to_s
    output = "\"#{name}\" - #{type} #{goldCoins}g"
    #if (type != TreasureKind::NECKLACE) # REV: NOT WORKING
      output += " #{minBonus}/#{maxBonus}"
    #end
    output
  end
  
end


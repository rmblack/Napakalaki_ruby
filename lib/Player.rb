require_relative 'TreasureKind'
require_relative 'Prize'
require_relative 'Monster'
require_relative 'BadConsequence'
require_relative 'Treasures'
require_relative 'CardDealer'
require_relative 'Dice'

class Player
  # Attributes
  @@MAXHIDDENTREASURES = 4
  def initialize(death, name, level, hiddenTreasures, visibleTreasures) 
   @dead = death
   @name = name
   @level = level
   @hiddenTreasures = hiddenTreasures
   @visibleTreasures = visibleTreasures
   @pendingBadConsequence
  end
  
  attr_reader :dead, :name, :level, :hiddenTreasures, :visibleTreasures, :pendingBadConsequence
  
  # Constructors
  private_class_method :new
  
  def self.newPlayer(name)
    new(true, name, 1, Array.new, Array.new) # Debug_1: fixed dead=true
  end
  
  # Private·protected usage functions
  
  def bringToLive()
    @dead = false;
  end
  
  def incrementLevels(num)
    @level = @level + num
  end
  
  def decrementLevels(num)
    @level = @level - num
    if (@level<1)
      @level=l
    end
    # Parece lógico que el jugado muera si pierde niveles cuando 
    # tiene uno solo, pero las reglas no indican nada al respecto
  end
  
  def setPendingBadConsequence(bc) # WARNING: argument must be a clone
    @pendingBadConsequence = bc
    # clone() does not behave as expected, check online documentation
  end
  
  def die # Debug_1: changed iteration implementation
    @dead = true;
    @level = 1
  # for treasure in @visibleTreasures
  #   CardDealer.instance.giveTreasureBack(treasure)
  # end
    @visibleTreasures.each { |t| CardDealer.instance.giveTreasureBack(t) }
    @visibleTreasures.clear
  # for treasure in @hiddenTreasures
  #   CardDealer.instance.giveTreasureBack(treasure)
  # end
    @hiddenTreasures.each { |t| CardDealer.instance.giveTreasureBack(t) }
    @hiddenTreasures.clear
  end
  
  def discardNecklaceIfVisible()
    @visibleTreasures.each do |t|
      if (t.type == TreasureKind::NECKLACE)
        CardDealer.instance.giveTreasureBack(t)
        @visibleTreasures.remove(t)
      end
    end
  end
  
  def dieIfNoTreasure()
    @dead = true if (visibleTreasures.empty? && hiddenTreasures.empty?)
  end
  
  def canIBuyLevels(lnum)
    (@level + lnum < 10) ? true : false
  end
  
  def computeGoldCoinsValue(tlist)
    output = 0
    tlist.each do |t| 
      output += t.goldCoins
    end
    output /= 1000
    output
  end
  
  # Public usage functions
  
  def applyPrize(prize)
    incrementLevels(prize.levels)
    for i in 0..prize.treasures 
      @hiddenTreasures.push(CardDealer.instance.nextTreasure())
    end
  end
  
  def applyBadConsequence(badYuyu)
    decrementLevels(badYuyu.levels)
    @pendingBadConsequence = badYuyu.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
  end
  
  def discardVisibleTreasure(treasure)
    @visibleTreasures.delete(treasure)
    if ((@pendingBadConsequence != nil) && (!@pendingBadConsequence.empty?))
      @pendingBadConsequence.substractVisibleTreasure(treasure)
    end
    CardDealer.instance.giveTreasureBack(treasure)
    dieIfNoTreasure()
  end
  
  def defdiscardHiddenTreasures(treasure)
    @hiddenTreasures.delete(treasure)
    if ((@pendingBadConsequence != nil) && (!@pendingBadConsequence.empty?))
      @pendingBadConsequence.substractHiddenTreasure(treasure)
    end
    CardDealer.instance.giveTreasureBack(treasure)
    dieIfNoTreasure()
  end
  
  def initTreasures
    bringToLive
    diceNumber = Dice.instance.nextNumber
    if (diceNumber == 1) 
      treasureNumber = 1
    elsif (diceNumber < 6)
      treasureNumber = 2
    else #number==6
      treasureNumber = 3
    end
  end

  def makeTreasureVisible(treasure)
    condition = false
    if canMakeTreasureVisible(treasure)
      @visibleTreasures.push(treasure)
      @hiddenTreasures.delete(treasure)
      condition = true
    end
    condition
  end
  
  def canMakeTreasureVisible(treasure)
    condition = false
    thisType = treasure.type
    if @hiddenTreasures.include?(thisType) # check if it's in hand
      condition = true
      # 3 possible cases
      case thisType
        when BOTHHANDS # can't when there's one\two hands
          @visibleTreasures.each do |t|
            condition = false if (BOTHHANDS == t.type)
            condition = false if (ONEHAND == t.type)
          end
        when ONEHAND # can't when two hands, can when just one
          hasOne = false
          @visibleTreasures.each do |t|
            condition = false if (BOTHHANDS == t.type)
            if (ONEHAND == t.type)
              (!hasOne)? hasOne=true : condition=false
            end
          end #each
        else # SHOE ARMOR NECKLACE HELMET
          @visibleTreasures.each do |t|
            condition = false if (thisType == t.type)
          end
      end #case
    end #if
    condition
  end
  
  def hasVisibleTreasures(treasure)
    !visibleTreasures.empty?
  end
  
  def buyLevels(vlist, hlist)
    levels = computeGoldCoinsValue(vlist)
    levels += computeGoldCoinsValue(hlist)
    levels = levels.to_i # Debug_1: (Remember ruby has no basic data types)
    canI = canIBuyLevels(levels)
    if canI
      incrementLevels(levels)
      vlist.each do |t|
        discardVisibleTreasure(t)
      end
      hlist.each do |t|
        discardHiddenTreasure(t)
      end
    end
    return canI
  end
  
  def validState
    (@pendingBadConsequence.empty? && (@hiddenTreasures.size <= @@MAXHIDDENTREASURES))
  end
  
  def getCombatLevel
    output = @level
    if hasNecklace()
      @visibleTreasures.each do |t| 
        output += t.maxBonus
      end
    else
      @visibleTreasures.each do |t|
        output += t.minBonus
      end
    end 
  end
  
  def combat(m) #monster
    myLevel = getCombatLevel
    levelMonster = m.combatLevel
    if ( myLevel > levelMonster) #win combat
      applyPrize(m.prize)
      if (@level == 10)
        result = CombatResult::WINANDWINGAME
      else
        result = CombatResult::WIN
      end
    else #lose combat
      escape = Dice.instance.nextNumber
      if (escape < 5) #you don't escape
        bc = m.badConsequence
        if (bc.kills)
          die
          result = CombatResult::LOSEANDDIE
        else
          applyBadConsequence(bc)
          result = CombatResult::LOSE
        end
      else #you escape
        result = CombatResult::LOSEANDESCAPE
      end
    end
    discardNecklaceIfVisible
    result
  end
  
  def to_s
    "\"#{name}\" (Level #{level})"
  end
  
end

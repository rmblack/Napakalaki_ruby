require_relativa 'Player'
require_relative 'TreasureKind'
require_relative 'Prize'
require_relative 'Monster'
require_relative 'BadConsequence'
require_relative 'Treasures'
require_relative 'CardDealer'
require_relative 'Dice'

class Napakalaki
  include Singleton
  # Attributes
  def initialize
    @currentPlayerIndex = -1
    @currentPlayer = nil
    @currentMonster = nil
    @players = Array.new
  end
  attr_accessor :currentPlayer, :currentMonster
  
  # Private usage functions
  
  def initPlayers(names)
    names.each do |name|
      @players.push(Player.new(name))
    end
  end
  
  def nextPlayer
    if (@currentPlayerIndex == -1) #first turn
       prng = Random.new
       @currentPlayerIndex = prng.rand(players.size())
    else
      @currentPlayerIndex = (@currentPlayerIndex+1) % @players.size
    end
    @players.get(@currentPlayerIndex)
  end
  
  def discardHiddenTreasure(t)
    @currentPlayer.discardHiddenTreasure(t)
  end
  
  def discardVisibleTreasure(t)
    @currentPlayer.discardVisibleTreasure(t)
  end
  
  def makeTreasureVisible(t)
    @currentPlayer.makeTreasureVisible(t)
  end
  
  def buyLevels (visible, hidden)
    @currentPlayer.buyLevels(visible, hidden)
  end
    
  def canMakeTreasureVisible(t)
    @currentPlayer.canMakeTreasureVisible(t)
  end
  
  def nextTurn
    condition = false
    if (nextTurnAllowed)
      @currentMonster = CardDealer.instance.nextMonster
      @currentPlayer = nextPlayer
      @currentPlayer.initTreasures if (@currentPlayer.dead)
      condition = true
    end
    condition
  end
  
  def nextTurnAllowed
    (@currentPlayer != nil)? @currentPlayer.validState : true
  end
  
  def endOfGame(result) #CombatResult
    (result == CombatResult::WINANDWINGAME)
  end
  
  def combat
    @currentPlayer.combat(@currentMonster)
  end
  
  def getVisibleTreasures()
    @currentPlayer.visibleTreasures
  end
    
  def getHiddenTreasures()
    @currentPlauer.hiddenTreasures
  end
  
end

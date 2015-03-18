# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
  def initialize (aText, someLevels, someVisibleTreasures,
                  someHiddenTreasures, someSpecificVisibleTreasures,
                  someSpecificHiddenTreasures, death)
    @text = aText
    @levels = someLevels
    @nVisibleTreasures = someVisibleTreasures
    @nHiddenTreasures = someHiddenTreasures
    @death = death
    @specificHiddenTreasures = someSpecificHiddenTreasures
    @specificVisibleTreasures = someSpecificVisibleTreasure
  end
  
  newNumberOfTreasures
  attr_accessor :text, :levels, :nVisibleTreasures, :nHiddenTreasures, :death, :specificHiddenTreasures, :specificVisibleTreasures
  
end

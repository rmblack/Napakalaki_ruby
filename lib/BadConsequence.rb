#encoding: UTF-8

class BadConsequence
  def initialize (text, levels, visibleTreasures,
                  hiddenTreasures, specificVisibleTreasures,
                  specificHiddenTreasures, death)
    @text = text                                         # string
    @levels = levels                                     # int
    @nVisibleTreasures = visibleTreasures                # int
    @nHiddenTreasures = hiddenTreasures                  # int
    @specificVisibleTreasures = specificVisibleTreasures # TreasureKind
    @specificHiddenTreasures = specificHiddenTreasures   # TreasureKind
    @death = death                                       # bool
  end 
 
  # constructors
  private_class_method :new
  
  def self.newNumberOfTreasures(text, levels, visibleTreasures,hiddenTreasures )
    new(text, levels, visibleTreasures, hiddenTreasures, Array.new, Array.new, false) #Debug_1: fixed death=false
  end
  
  def self.newSpecificTreasures(text, levels, specificVisibleTreasures, specificHiddenTreasures)
    new(text, levels, 0, 0, specificVisibleTreasures, specificHiddenTreasures, false) #Debug_1: fixed array size given as number of treasures
  end
  
  def self.newDeath (text)
    new(text, 0, 0, 0, Array.new, Array.new, true)
  end
 
  # Getters  # Debug_1: changed access to read only
  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures,
              :death, :specificHiddenTreasures, :specificVisibleTreasures
  
  def kills
    @death
  end
  
  def substractVisibleTreasure(t)
    specificVisibleTreasures.remove(t.type)
    nVisibleTreasures = nVisibleTreasures -1
  end
  
  def substractHiddenTreasure(t)
    specificHiddenTreasures.remove(t.type)
    nHiddenTreasures = nHiddenTreasures -1
  end
  
  def isEmpty
    output = false;
    if (levels==0 &&
        nVisibleTreasures<=0 && # You can discard more than needed
        nHiddenTreasures<= 0 && # "
        specificVisibleTreasures.empty? &&
        specificHiddenTreasures.empty?)
        output = true;
    end
    output
  end
  
  def adjustToFitTreasureLists()
    # REV
  end
  
  def to_s
    text
 #  output = "\"#{text}\" "
 #  unless ( death )
 #    output += "\nNiveles perdidos: #{levels} "
 #    if ( specificHiddenTreasures.empty?  && specificVisibleTreasures.empty?)
 #      output += "\nTesoros visibles perdidos: #{nVisibleTreasures}" +
 #                "\nTesoros ocultos perdidos: #{nHiddenTreasures}"
 #    else
 #      output += "\nTesoros visibles especificos perdidos: " + 
 #                specificVisibleTreasures.to_s +
 #                "\nTesoros ocultos especificos perdidos: " +
 #                specificHiddenTreasures.to_s
 #    end
 #  end
 #  output
  end
end

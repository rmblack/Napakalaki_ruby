#encoding: utf-8

#EXAMEN
require_relative 'Prize'
require_relative 'TreasureKind'
require_relative 'BadConsequence'
require_relative 'Monster.rb'
class Examen

  def main
    monsters = Array.new
    
    name_m1 = "Monstruo 1 examen"
    name_m2 = "Monstruo 2 examen"
    name_m3 = "Monstruo 3 examen"
    name_m4 = "Monstruo 4 examen"
    
    prize_m1 = Prize.new(2,0)
    prize_m2 = Prize.new(1, 2)
    prize_m3 = Prize.new(1,1)
    prize_m4 = Prize.new(5, 0)
    
    array_visible = Array.new
    array_hidden = Array.new
    
    array_visible << TreasureKind::ONEHAND
    array_hidden << TreasureKind::ONEHAND
    array_hidden << TreasureKind::ARMOR
    
    bj_m1 = BadConsequence.newNumberOfTreasures("Pierdes 2 niveles y 3 tesos visibles", 2, 3, 0)
    bj_m2 = BadConsequence.newNumberOfTreasures("Pierdes 1 tesoros visible y 2 ocultos", 0, 1, 2)
    bj_m3 = BadConsequence.newSpecificTreasures("Pierdes una mano visible, otra oculta y una armadura oculta", 0, array_visible, array_hidden)
    bj_m4 = BadConsequence.newDeath("Estás muerto")
    
    monsters << Monster.new(name_m1, 12, prize_m1, bj_m1)
    monsters << Monster.new(name_m2, 5, prize_m2, bj_m2)
    monsters << Monster.new(name_m3, 3, prize_m3, bj_m3)
    monsters << Monster.new(name_m4, 1, prize_m4, bj_m4)
    
    for i in 0..4
      puts monsters[i].to_s
    end
  end
end

examen2 = Examen.new
examen2.main
# FIN EXAMEN
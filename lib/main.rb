#encoding: UTF-8

require_relative 'Prize'
require_relative 'TreasureKind'
require_relative 'BadConsequence'
require_relative 'Monster'
require_relative 'Treasure'

monsters = Array.new

# Monster text
text_name_1 = "Byakhees de bonanza"
text_name_2 = "Chibithulhu"
text_name_3 = "El sopor de Dunwich"
text_name_4 = "Ángeles de la noche ibicenca"
text_name_5 = "El gorrón del umbral"
text_name_6 = "H.P. Munchcraft"
text_name_7 = "Bichgooth"
text_name_8 = "El rey de rosa"
text_name_9 = "La que redacta en las tinieblas"
text_name_10 = "Los hondos"
text_name_11 = "Semillas Cthulhu"
text_name_12 = "Dameargo"
text_name_13 = "Pollipólipo volante"
text_name_14 = "Yskhtihyssg-Goth"
text_name_15 = "Familia feliz"
text_name_16 = "Roboggoth"
text_name_17 = "El espia"
text_name_18 = "El Lenguas"
text_name_19 = "Bicéfalo"
# badJuju text
text_badjuju_1 = "Pierdes tu armadura visible y otra oculta."
text_badjuju_2 = "Embobados con el lindo primigenio te descartas de tu casco visible."
text_badjuju_3 = "El primordial bostezo contagioso. Pierdes el calzaco visible."
text_badjuju_4 = "Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta."
text_badjuju_5 = "Pierdes todos tus tesoros visibles."
text_badjuju_6 = "Pierdes la armadura visible."
text_badjuju_7 = "Sientes bichos bajo la ropa. Descarta tu mano visible."
text_badjuju_8 = "Pierdes 5 niveles y 3 tesoros visibles."
text_badjuju_9 = "Toses los pulmones y pierdes 2 niveles."
text_badjuju_10 = "Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto."
text_badjuju_11 = "Pierdes 2 niveles y 2 tesoros ocultos."
text_badjuju_12 = "Te intentas escaquear. Pierdes una mano visible."
text_badjuju_13 = "Da mucho asquito, Pierdes 3 niveles."
text_badjuju_14 = "No le hace gracia que pronuncien mal su nombre. Estás muerto."
text_badjuju_15 = "La familia te atrapa, Estás muerto."
text_badjuju_16 = "La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible."
text_badjuju_17 = "Te asusta en la noche. Pierdes un casco visible."
text_badjuju_18 = "Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles."
text_badjuju_19 = "Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos."
# Prize text
prize_1 = Prize.new(2, 1)
prize_2 = Prize.new(1, 1)
prize_3 = Prize.new(1, 1)
prize_4 = Prize.new(4, 1)
prize_5 = Prize.new(3, 1)
prize_6 = Prize.new(2, 1)
prize_7 = Prize.new(1, 1)
prize_8 = Prize.new(4, 2)
prize_9 = Prize.new(1, 1)
prize_10 = Prize.new(2, 1)
prize_11 = Prize.new(2, 1)
prize_12 = Prize.new(2, 1)
prize_13 = Prize.new(1, 1)
prize_14 = Prize.new(3, 1)
prize_15 = Prize.new(4, 1)
prize_16 = Prize.new(2, 1)
prize_17 = Prize.new(1, 1)
prize_18 = Prize.new(1, 1)
prize_19 = Prize.new(1, 1)
# arrays
list_v_1 = Array.new
list_v_1 << TreasureKind::ARMOR
list_h_1 = Array.new
list_h_1<< TreasureKind::ARMOR
list_v_2 = Array.new
list_v_2 << TreasureKind::HELMET
list_h_2 = Array.new
list_v_3 = Array.new
list_v_3 << TreasureKind::SHOE
list_h_3 = Array.new
list_v_4 = Array.new
list_v_4 << TreasureKind::ONEHAND
list_h_4 = Array.new
list_h_4 << TreasureKind::ONEHAND
list_v_6 = Array.new
list_v_6 << TreasureKind::ARMOR
list_h_6 = Array.new
list_v_7 = Array.new
list_v_7 << TreasureKind::ARMOR
list_h_7 = Array.new
list_v_12 = Array.new
list_v_12 << TreasureKind::ONEHAND
list_h_12 = Array.new
list_v_16 = Array.new
list_v_16 << TreasureKind::BOTHHANDS
list_h_16 = Array.new
list_v_17 = Array.new
list_v_17 << TreasureKind::HELMET
list_h_17 = Array.new
list_v_19 = Array.new
list_v_19 << TreasureKind::ONEHAND 
list_v_19 << TreasureKind::BOTHHANDS
list_h_19 =  Array.new
  
bc_1 = BadConsequence.newSpecificTreasures(text_badjuju_1, 0, list_v_1, list_h_1)
bc_2 = BadConsequence.newSpecificTreasures(text_badjuju_2, 0, list_v_2, list_h_2)
bc_3 = BadConsequence.newSpecificTreasures(text_badjuju_3, 0, list_v_3, list_h_3)
bc_4 = BadConsequence.newSpecificTreasures(text_badjuju_4, 0, list_v_4, list_h_4)
bc_5 = BadConsequence.newNumberOfTreasures(text_badjuju_5, 0, 1000, 0)
bc_6 = BadConsequence.newSpecificTreasures(text_badjuju_6, 0, list_v_6, list_h_6)
bc_7 = BadConsequence.newSpecificTreasures(text_badjuju_7, 0, list_v_7, list_h_7)
bc_8 = BadConsequence.newNumberOfTreasures(text_badjuju_8, 5, 3, 0)
bc_9 = BadConsequence.newNumberOfTreasures(text_badjuju_9, 2, 0, 0)
bc_10 = BadConsequence.newDeath(text_badjuju_10)
bc_11 = BadConsequence.newNumberOfTreasures(text_badjuju_11, 2, 0, 2)
bc_12 = BadConsequence.newSpecificTreasures(text_badjuju_12, 0, list_v_12, list_h_12)
bc_13 = BadConsequence.newNumberOfTreasures(text_badjuju_13, 3, 0, 0)
bc_14 = BadConsequence.newDeath(text_badjuju_14)
bc_15 = BadConsequence.newDeath(text_badjuju_15)
bc_16 = BadConsequence.newSpecificTreasures(text_badjuju_16, 2, list_v_16, list_h_16)
bc_17 = BadConsequence.newSpecificTreasures(text_badjuju_17, 0, list_v_17, list_h_17)
bc_18 = BadConsequence.newNumberOfTreasures(text_badjuju_18, 2, 5, 0)
bc_19 = BadConsequence.newSpecificTreasures(text_badjuju_19, 3, list_v_19, list_h_19)


monsters << monstruo_1 = Monster.new(text_name_1, 8, prize_1, bc_1)
monsters << monstruo_2 = Monster.new(text_name_2, 2, prize_2, bc_2)
monsters << monstruo_3 = Monster.new(text_name_3, 2, prize_3, bc_3)
monsters << monstruo_4 = Monster.new(text_name_4, 14, prize_4, bc_4)
monsters << monstruo_5 = Monster.new(text_name_5, 10, prize_5, bc_5)
monsters << monstruo_6 = Monster.new(text_name_6, 6, prize_6, bc_6)
monsters << monstruo_7 = Monster.new(text_name_7, 2, prize_7, bc_7)
monsters << monstruo_8 = Monster.new(text_name_8, 13, prize_8, bc_8)
monsters << monstruo_9 = Monster.new(text_name_9, 2, prize_9, bc_9)
monsters << monstruo_10 = Monster.new(text_name_10, 8, prize_10, bc_10)
monsters << monstruo_11 = Monster.new(text_name_11, 4, prize_11, bc_11)
monsters << monstruo_12 = Monster.new(text_name_12, 1, prize_12, bc_12)
monsters << monstruo_13 = Monster.new(text_name_13, 3, prize_13, bc_13)
monsters << monstruo_14 = Monster.new(text_name_14, 12, prize_14, bc_14)
monsters << monstruo_15 = Monster.new(text_name_15, 1, prize_15, bc_15)
monsters << monstruo_16 = Monster.new(text_name_16, 8, prize_16, bc_16)
monsters << monstruo_17 = Monster.new(text_name_17, 5, prize_17, bc_17)
monsters << monstruo_18 = Monster.new(text_name_18, 20, prize_18, bc_18)
monsters << monstruo_19 = Monster.new(text_name_19, 20, prize_19, bc_19)


#Testing

puts "-- Prize testing--"
prize1 = Prize.new(1,2)
prize2 = Prize.new(3,3)
prize3 = Prize.new(10,10)
#puts "treasures: " + prize1.treasures.to_s()
#puts "levels: " + prize1.levels.to_s()
puts prize1.to_s
puts prize2.to_s
puts prize3.to_s

puts "-- TreasureKind testing --"
puts "SHOE kind: " + TreasureKind::SHOE.to_s()

puts "-- BC Testing --"
s_bc1 = "Le mal rollo Anselmo"
s_bc2 = "Le mal rollo Eustaquio"
Vis = Array.new
Hid = Array.new
Vis << TreasureKind::ARMOR << TreasureKind::SHOE
Hid << TreasureKind::HELMET
bc1 = BadConsequence.newNumberOfTreasures(s_bc1, 1, 2, 3)
bc2 = BadConsequence.newSpecificTreasures(s_bc2, 2, Vis, Hid)
bc3 = BadConsequence.newDeath("You die, Horribly")
#puts "name: " + bc1.text
#puts "levels: " + bc1.levels.to_s()
#puts "nHidden: " + bc1.nHiddenTreasures.to_s()
#puts "nVisible: " + bc1.nVisibleTreasures.to_s()
#puts "death: " + bc1.death.to_s()
puts bc1.to_s
puts bc2.to_s
puts bc3.to_s

puts "-- Monster Testing --"
monster1 = Monster.new("Anselmo",3,prize1,bc1)
monster2 = Monster.new("Eustaqio", 2, prize2, bc2)
monster3 = Monster.new("Albert", 10, prize3, bc3)
#puts "Name: " + monster1.name
#puts "prize: " + monster1.prize.treasures.to_s() + ", " + monster1.prize.levels.to_s()
puts monster1.to_s
puts monster2.to_s
puts monster3.to_s
#
puts "-- Treasure Testing --"
treasure1 = Treasure.new("golden ring",1000,2,3, TreasureKind::NECKLACE)
puts treasure1.to_s
puts "SUCCESS!"

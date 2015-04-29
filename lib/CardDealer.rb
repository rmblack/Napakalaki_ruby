
class CardDealer
  # Singleton build
  include Singleton
  # Attributes
  def initialize
    @unusedMonsters = Array.new
    @usedMonsters = Array.new
    @unusedTreasures = Array.new
    @usedTreasures = Array.new
  end
  
  # Private functions
  private :initMonsterCardDeck, :initTreasureCardDeck, :shuffleTreasures, :shuffleMonsters
  def initMonsterCardDeck()
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
    # BadConsequence for each monster
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
    # Put in list
    @unusedMonsters << monstruo_1 = Monster.new(text_name_1, 8, prize_1, bc_1)
    @unusedMonsters << monstruo_2 = Monster.new(text_name_2, 2, prize_2, bc_2)
    @unusedMonsters << monstruo_3 = Monster.new(text_name_3, 2, prize_3, bc_3)
    @unusedMonsters << monstruo_4 = Monster.new(text_name_4, 14, prize_4, bc_4)
    @unusedMonsters << monstruo_5 = Monster.new(text_name_5, 10, prize_5, bc_5)
    @unusedMonsters << monstruo_6 = Monster.new(text_name_6, 6, prize_6, bc_6)
    @unusedMonsters << monstruo_7 = Monster.new(text_name_7, 2, prize_7, bc_7)
    @unusedMonsters << monstruo_8 = Monster.new(text_name_8, 13, prize_8, bc_8)
    @unusedMonsters << monstruo_9 = Monster.new(text_name_9, 2, prize_9, bc_9)
    @unusedMonsters << monstruo_10 = Monster.new(text_name_10, 8, prize_10, bc_10)
    @unusedMonsters << monstruo_11 = Monster.new(text_name_11, 4, prize_11, bc_11)
    @unusedMonsters << monstruo_12 = Monster.new(text_name_12, 1, prize_12, bc_12)
    @unusedMonsters << monstruo_13 = Monster.new(text_name_13, 3, prize_13, bc_13)
    @unusedMonsters << monstruo_14 = Monster.new(text_name_14, 12, prize_14, bc_14)
    @unusedMonsters << monstruo_15 = Monster.new(text_name_15, 1, prize_15, bc_15)
    @unusedMonsters << monstruo_16 = Monster.new(text_name_16, 8, prize_16, bc_16)
    @unusedMonsters << monstruo_17 = Monster.new(text_name_17, 5, prize_17, bc_17)
    @unusedMonsters << monstruo_18 = Monster.new(text_name_18, 20, prize_18, bc_18)
    @unusedMonsters << monstruo_19 = Monster.new(text_name_19, 20, prize_19, bc_19)
  end
  
  def initTreasureCardDeck
    # name text
    text_treasure_1 = "¡Sí mi amo!"
    text_treasure_2 = "Botas de investigación"
    text_treasure_3 = "Capucha de Cthulhu"
    text_treasure_4 = "A prueba de babas"
    text_treasure_5 = "Botas de lluvia ácida"
    text_treasure_6 = "Casco minero"
    text_treasure_7 = "Ametrallaoora Thompson"
    text_treasure_8 = "Camiseta de la UGR"
    text_treasure_9 = "Clavo de rail ferroviario"
    text_treasure_10 = "Cuchillo de sushi arcano"
    text_treasure_11 = "Fez alópodo"
    text_treasure_12 = "Hacha prehistórica"
    text_treasure_13 = "El apartado del Pr. Tesla"
    text_treasure_14 = "Gaita"
    text_treasure_15 = "Insecticida"
    text_treasure_16 = "Escopeta de 3 cañones"
    text_treasure_17 = "Garabato místico"
    text_treasure_18 = "La fuerza de Mr.T"
    text_treasure_19 = "La rebeca metálica"
    text_treasure_20 = "Mazo de los antiguos"
    text_treasure_21 = "Necro-playboycón"
    text_treasure_22 = "Lanzallamas"
    text_treasure_23 = "Necrocomicón"
    text_treasure_24 = "Necronomicón"
    text_treasure_25 = "Linterna a 2 manos"
    text_treasure_26 = "Necro-gnomicón"
    text_treasure_27 = "Necrotelecom"
    text_treasure_28 = "Porra preternatural"
    text_treasure_29 = "Tentáculo de pega"
    text_treasure_30 = "Zapato deja-amigos"
    text_treasure_31 = "Shogulador"
    text_treasure_32 = "Varita de atizamiento"
    # Put in list
    @unusedTreasures << treasure_1 = Treasure.new(text_treasure_1, 0, 4, 7, TreasureKind::HELMET)
    @unusedTreasures << treasure_2 = Treasure.new(text_treasure_2, 600, 3, 4, TreasureKind::SHOE)
    @unusedTreasures << treasure_3 = Treasure.new(text_treasure_3, 500, 3, 5, TreasureKind::HELMET)
    @unusedTreasures << treasure_4 = Treasure.new(text_treasure_4, 400, 2, 5, TreasureKind::ARMOR)
    @unusedTreasures << treasure_5 = Treasure.new(text_treasure_5, 800, 1, 1, TreasureKind::SHOE)
    @unusedTreasures << treasure_6 = Treasure.new(text_treasure_6, 400, 2, 4, TreasureKind::HELMET)
    @unusedTreasures << treasure_7 = Treasure.new(text_treasure_7, 600, 4, 8, TreasureKind::BOTHHANDS)
    @unusedTreasures << treasure_8 = Treasure.new(text_treasure_8, 100, 1, 7, TreasureKind::ARMOR)
    @unusedTreasures << treasure_9 = Treasure.new(text_treasure_9, 400, 3, 6, TreasureKind::ONEHAND)
    @unusedTreasures << treasure_10 = Treasure.new(text_treasure_10, 300, 2, 3, TreasureKind::ONEHAND)
    @unusedTreasures << treasure_11 = Treasure.new(text_treasure_11, 700, 3, 5, TreasureKind::HELMET)
    @unusedTreasures << treasure_12 = Treasure.new(text_treasure_12, 500, 2, 5, TreasureKind::ONEHAND)
    @unusedTreasures << treasure_13 = Treasure.new(text_treasure_13, 900, 4, 8, TreasureKind::ARMOR)
    @unusedTreasures << treasure_14 = Treasure.new(text_treasure_14, 500, 4, 5, TreasureKind::BOTHHANDS)
    @unusedTreasures << treasure_15 = Treasure.new(text_treasure_15, 300, 2, 3, TreasureKind::ONEHAND)
    @unusedTreasures << treasure_16 = Treasure.new(text_treasure_16, 700, 4, 6, TreasureKind::BOTHHANDS)
    @unusedTreasures << treasure_17 = Treasure.new(text_treasure_17, 300, 2, 2, TreasureKind::ONEHAND)
    @unusedTreasures << treasure_18 = Treasure.new(text_treasure_18, 1000, 0, 0, TreasureKind::NECKLACE)
    @unusedTreasures << treasure_19 = Treasure.new(text_treasure_19, 400, 2, 3, TreasureKind::ARMOR)
    @unusedTreasures << treasure_20 = Treasure.new(text_treasure_20, 200, 3, 4, TreasureKind::ONEHAND)
    @unusedTreasures << treasure_21 = Treasure.new(text_treasure_21, 300, 3, 5, TreasureKind::ONEHAND)
    @unusedTreasures << treasure_22 = Treasure.new(text_treasure_22, 800, 4, 8, TreasureKind::BOTHHANDS)
    @unusedTreasures << treasure_23 = Treasure.new(text_treasure_23, 100, 1, 1, TreasureKind::ONEHAND)
    @unusedTreasures << treasure_24 = Treasure.new(text_treasure_24, 800, 5, 7, TreasureKind::BOTHHANDS)
    @unusedTreasures << treasure_25 = Treasure.new(text_treasure_25, 400, 3, 6, TreasureKind::BOTHHANDS)
    @unusedTreasures << treasure_26 = Treasure.new(text_treasure_26, 200, 2, 4, TreasureKind::ONEHAND)
    @unusedTreasures << treasure_27 = Treasure.new(text_treasure_27, 300, 2, 3, TreasureKind::HELMET)
    @unusedTreasures << treasure_28 = Treasure.new(text_treasure_28, 200, 2, 3, TreasureKind::ONEHAND)
    @unusedTreasures << treasure_29 = Treasure.new(text_treasure_29, 200, 0, 1, TreasureKind::HELMET)
    @unusedTreasures << treasure_30 = Treasure.new(text_treasure_30, 500, 0, 1, TreasureKind::SHOE)
    @unusedTreasures << treasure_31 = Treasure.new(text_treasure_31, 600, 1, 1, TreasureKind::BOTHHANDS) 
    @unusedTreasures << treasure_32 = Treasure.new(text_treasure_32, 400, 3, 4, TreasureKind::ONEHAND)
  end
  
  def shuffleTreasures
    @unusedTreasures.shuffle!
  end
  
  def shuffleMonsters
    @unusedMonsters.shuffle!
  end
  
  # Public functions
  
  def nextTreasure
    output = @unusedTreasures.pop()
    if (@unusedTreasures.size == 0)
      swap = @usedTreasures
      @usedTreasures = @unusedTreasures
      @unusedTreasures = swap
    end
    output
  end
  
  def nextMonster
    output = @unusedMonsters.pop()
    if (@unusedMonsters.empty?)
      swap = @usedMonsters
      @usedMonsters = @unusedMonsters
      @unusedMonsters = swap
    end
    output
  end
  
  def giveTreasureBack(t)
    @usedTreasures.push(t)
    @unusedTreasures.delete(t)
  end
  
  def giveMonsterBack(m)
    @usedMonsters.push(m)
    @unusedMonsters.delete(m)
  end
  
  def initCards()
    initMonsterCardDeck
    initTreasureCardDeck
    shuffleMonsters
    shuffleTreasures
  end
  
end

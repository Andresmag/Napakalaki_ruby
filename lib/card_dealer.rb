# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

include Singleton

class CardDealer
  @@instance = nil
  def initialize
    
  end
  
  attr_reader :instance
  attr_accessor :used_treasures, :unused_treasures , :used_monsters , :unused_monsters
  
  def get_instance
    if @@instance == nil
      @@instance = new CardDealer();
    end
    @@instance
  end
  
  def init_treasure_card_deck
  end
  
  def init_monster_card_deck
    #Array que contiene a los monstruos
    monster = Array.new

    #monster[0] = 3 Byakhees de bonanza
    prize = Prize.new(2, 1)
    bad_consequence = BadConsequence.new_level_specific_treasures('Pierdes tu armadura visible y otra oculta', 0,
     [TreasureKind::ARMOR] , [TreasureKind::ARMOR]  )
    monster << Monster.new('3 Byahkees de bonanza', 8, bad_consequence, prize)

    #monster[1] = Chibithulhu
    prize = Prize.new(1, 1);
    bad_consequence = BadConsequence.new_level_specific_treasures("Embobados con el lindo primigenio te descartas de tu casco visible",
      0, [TreasureKind::HELMET] , Array.new )
    monster << Monster.new('Chibithulhu', 2, bad_consequence, prize)

    #monster[2] = El sopor de Dunwich
    prize = Prize.new(1, 1);
    bad_consequence = BadConsequence.new_level_specific_treasures("El primordial bostezo contagioso. Pierdes el calzado visible",
      0, [TreasureKind::SHOES] , Array.new )
    monster << Monster.new('El sopor de Dunwich', 2, bad_consequence, prize)

    #monster[3] = Angeles de la noche ibicenca
    prize = Prize.new(4,1)
    bad_consequence = BadConsequence.new_level_specific_treasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta",
      0, [TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
    monster << Monster.new('Angeles de la noche ibicenca', 14, bad_consequence, prize)

    #monster[4] = El gorrón en el umbral
    prize = Prize.new(3,1)
    bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes todos tus tesoros visibles', 0, 10, 0)
    monster << Monster.new('El gorron en el umbral',10,bad_consequence, prize)

    #monster[5]= H.P. Munchcraft
    prize = Prize.new(2,1)
    bad_consequence = BadConsequence.new_level_specific_treasures('Pierdes la armadura visible', 0,[TreasureKind::ARMOR] , Array.new )
    monster << Monster.new('H.P. Munchcraft',6,bad_consequence, prize)

    #monster[6]= Bichgooth
    prize = Prize.new(1,1)
    bad_consequence = BadConsequence.new_level_specific_treasures('Sientes bichos bajo la ropa. Descarta la armadura visible',
      0, [TreasureKind::ARMOR] , Array.new )
    monster << Monster.new('Bichgooth',2,bad_consequence, prize)

    #monster[7]= El rey de rosa
    prize = Prize.new(4,2)
    bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes 5 niveles y 3 tesoros visibles',
      5, 3, 0)
    monster << Monster.new('El rey de rosa',13,bad_consequence, prize)

    #monster[8]= La que redacta en las tinieblas
    prize = Prize.new(1,1)
    bad_consequence = BadConsequence.new_level_number_of_treasures('Toses los pulmones y pierdes 2 niveles',
      2, 0, 0)
    monster << Monster.new('La que redacta en las tinieblas',2,bad_consequence, prize)

    #monster[9]= Los hondos
    prize = Prize.new(2,1)
    bad_consequence = BadConsequence.new_death('Estos monstruos resultan bastante superficiales y te aburren moralmente. Estas muerto') 
    monster << Monster.new('Los hondos',8,bad_consequence, prize)

    #monster[10]= Semillas Cthulhu
    prize = Prize.new(2,1)
    bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes 2 niveles y 2 tesoros ocultos',
      2, 0, 2)
    monster << Monster.new('Semillas Cthulhu',4,bad_consequence, prize)

    #monster[11]= Dameargo
    prize = Prize.new(2,1)
    bad_consequence = BadConsequence.new_level_specific_treasures('Te intentas escaquear. Pierdes una mano visible',
      0, [TreasureKind::ONEHAND] , Array.new )
    monster << Monster.new('Dameargo',1,bad_consequence, prize)

    #monster[12]= Pollipólipo volante
    prize = Prize.new(1,1)
    bad_consequence = BadConsequence.new_level_number_of_treasures('Da mucho asquito. Pierdes 3 niveles',
      3, 0, 0)
    monster << Monster.new('Pollipolipo volante',3,bad_consequence, prize)

    #monster[13]= Yskhtihyssg-Goth
    prize = Prize.new(3,1) 
    bad_consequence = BadConsequence.new_death('No le hace gracia que pronuncien mal su nombre. Estas muerto') 
    monster << Monster.new('Yskhtihyssg-Goth',12,bad_consequence, prize)

    #monster[14]= Familia feliz
    prize = Prize.new(4,1) 
    bad_consequence = BadConsequence.new_death('La familia te atrapa. Estas muerto') 
    monster << Monster.new('Familia feliz',1,bad_consequence, prize)

    #monster[15]= Roboggoth
    prize = Prize.new(2,1)
    bad_consequence = BadConsequence.new_level_specific_treasures('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible',
      2, [TreasureKind::BOTHHANDS] , Array.new )
    monster << Monster.new('Roboggoth',8,bad_consequence, prize)

    #monster[16]= El espia
    prize = Prize.new(1,1)
    bad_consequence = BadConsequence.new_level_specific_treasures('Te asusta por la noche. Pierdes un casco visible',
      0, [TreasureKind::HELMET] , Array.new )
    monster << Monster.new('El espia',5,bad_consequence, prize)

    #monster[17]= El lenguas
    prize = Prize.new(1,1)
    bad_consequence = BadConsequence.new_level_number_of_treasures('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.',
     2, 5, 0)
    monster << Monster.new('El lenguas',20,bad_consequence, prize)

    #monster[18]= El bicéfalo
    prize = Prize.new(1,1)
    bad_consequence = BadConsequence.new_level_specific_treasures('Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos',
      3, [TreasureKind::ONEHAND,TreasureKind::ONEHAND,TreasureKind::BOTHHANDS] , Array.new )
    monster << Monster.new('Bicefalo',20,bad_consequence, prize)
    
    unused_monster = monster
    
  end
  
  def suffle_treasures
    unused_treasures.shuffle!
  end
  
  def suffle_monsters
    unused_monsters.shuffle!
  end
  
  def next_treasure
        if(unused_treasures.isEmpty())
            #Lo volvemos a rellenar
            used_treasures.length.times do |num|
                unused_treasures.add(used_treasures.get(num))
            end
            
            #Lo volvemos a barajar
            shuffle_treasures()
            
            #Limpiamos el mazo de descartes
            used_treusures.clear()
        end
        
        #Cojemos el primero
        t = unused_treasures.get(0)
        
        #Lo añadimos al mazo de descartes para no volver a cogerlo
        give_treasures_back(t)
        
        #Y lo quitamos del mazo de donde se cogen para evitar repetirlo
        unused_treasures.remove(t)
        
        t    
  end
  
  def next_monster
        if(unused_monsters.isEmpty())
            #Lo volvemos a rellenar
            used_monsters.length.times do |num|
                unused_monsters.add(used_monsters.get(num))
            end
            
            #Lo volvemos a barajar
            shuffle_monsters()
            
            #Limpiamos el mazo de descartes
            used_monsters.clear()
        end
        
        #Cojemos el primero
        m = unused_monsters.get(0)
        
        #Lo añadimos al mazo de descartes para no volver a cogerlo
        give_monster_back(m)
        
        #Y lo quitamos del mazo de donde se cogen para evitar repetirlo
        unused_monsters.remove(m)
        
        m    
  end
  
  def give_treasure_back(t)
    used_treasures.add(t)
  end
  
  def give_monster_back(m)
    used_monsters.add(t);
  end
  
  def init_cards
        init_treasure_card_deck()
        init_monster_card_deck()
  end
  
end

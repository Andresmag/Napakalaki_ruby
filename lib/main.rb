#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#Autors:
# => Andresmag
# => Algebro


#Prueba de la clase prize y monster combinadas

require './Prize'
require './Monster'
require './bad_consequence.rb'
require './treasure_kind.rb'

#Array que contiene a los monstruos
monster = Array.new

#monster[0] = 3 Byakhees de bonanza
prize = Prize.new(2, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Pierdes tu armadura visible y otra oculta', 0,
 [TreasureKind::ARMOR] , [TreasureKind::ARMOR]  )
monster << Monster.new('3 Byahkees de bonanza', 8, bad_consequence, prize)

#monster[1] = Chibithulhu
prize = Prize.new(1, 1);
bad_consequence = BadConsequence.new_level_specific_treasures("Embobados con el lindo primigeniote descartas de tu casco visible",
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
monster << Monster.new('El gorrón en el umbral',10,bad_consequence, prize)

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
bad_consequence = BadConsequence.new_level_number_of_treasures('Toses tus pulmones y pierdes 2 niveles',
  2, 0, 0)
monster << Monster.new('La que redacta en las tinieblas',2,bad_consequence, prize)

#monster[9]= Los hondos
prize = Prize.new(2,1)
bad_consequence = BadConsequence.new_death('Estos monstruos resultan bastante superficiales y te aburren moralmente. Estás muerto') 
monster << Monster.new('Los hondos',8,bad_consequence, prize)

#monster[10]= Semillas Cthulhu
prize = Prize.new(2,1)
bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes 2 niveles y 2 tesoros ocultos',
  2, 0, 2)
monster << Monster.new('Semillas Cthulhu',2,bad_consequence, prize)

#monster[11]= Dameargo
prize = Prize.new(2,1)
bad_consequence = BadConsequence.new_level_specific_treasures('Te intentas escaquear. Pierdes una mano visible',
  0, [TreasureKind::ONEHAND] , Array.new )
monster << Monster.new('Dameargo',1,bad_consequence, prize)

#monster[12]= Pollipólipo volante
prize = Prize.new(1,1)
bad_consequence = BadConsequence.new_level_number_of_treasures('Da mucho asquito. Pierdes 3 niveles',
  3, 0, 0)
monster << Monster.new('Pollipólipo volante',3,bad_consequence, prize)

#monster[13]= Yskhtihyssg-Goth
prize = Prize.new(3,1) 
bad_consequence = BadConsequence.new_death('No le hace gracia que pronuncien mal su nombre. Estás muerto') 
monster << Monster.new('Yskhtihyssg-Goth',12,bad_consequence, prize)

#monster[14]= Familia feliz
prize = Prize.new(4,1) 
bad_consequence = BadConsequence.new_death('La familia te atrapa. Estás muerto') 
monster << Monster.new('Familia feliz',1,bad_consequence, prize)

#monster[15]= Roboggoth
prize = Prize.new(2,1)
bad_consequence = BadConsequence.new_level_specific_treasures('Da mucho asquito. Pierdes 3 niveles',
  2, [TreasureKind::BOTHHAND] , Array.new )
monster << Monster.new('Roboggoth',3,bad_consequence, prize)

#monster[16]= El espia
prize = Prize.new(1,1)
bad_consequence = BadConsequence.new_level_specific_treasures('Te asusta por la noche. Pierdes un casco visible',
  0, [TreasureKind::HELMET] , Array.new )
monster << Monster.new('El espìa',5,bad_consequence, prize)

#monster[17]= El lenguas
prize = Prize.new(1,1)
bad_consequence = BadConsequence.new_level_number_of_treasures('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.',
 2, 5, 0)
monster << Monster.new('El lenguas',20,bad_consequence, prize)

#monster[18]= El bicéfalo
prize = Prize.new(1,1)
bad_consequence = BadConsequence.new_level_specific_treasures('Te faltna manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos',
  3, [TreasureKind::ONEHAND,TreasureKind::ONEHAND,TreasureKind::BOTHHAND] , Array.new )
monster << Monster.new('El bicéfalo',20,bad_consequence, prize)


monster.length.times do |num|
  puts (monster[num])
  puts "\n\n"
end  

#Consultores de monstruos

#Muestra los monstruos con nivel superior a 10
def monstruos_mas_10(monster)
  puts "MONSTRUOS CON NIVEL SUPERIOR A 10: \n\n"
  monster.length.times { |num| if (monster[num].combat_level > 10); puts monster[num]; puts "\n\n" end }
end

monstruos_mas_10(monster) 

#Mostrar todos los monstruos que tengan un mal rollo que implique sólo pérdida de niveles
def solo_perdida_niveles(monster)
  puts "MONSTRUOS CUYO MAL ROLLO SOLO IMPLICA PERDIDA DE NIVELES: \n\n"
  monster.length.times do |num|  
    if (monster[num].bad_consequence.levels > 0 && monster[num].bad_consequence.n_visible_treasures == 0 && monster[num].bad_consequence.n_hidden_treasures == 0 && monster[num].bad_consequence.specific_visible_treasures.size == 0 && 
        monster[num].bad_consequence.specific_hidden_treasures.size == 0 && !monster[num].bad_consequence.death)
        puts monster[num]
        puts "\n\n" 
    end
  end
end

#solo_perdida_niveles(monster) para utilizar el consultor

#Mostrar todos los monstruos que tengan un buen rollo que indique una ganancia de niveles superior a 1
def ganar_mas_1_nivel(monster)
  puts "MONSTRUOS CON LOS QUE GANAS MAS DE UN NIVEL: \n\n"
  monster.length.times { |num| if (monster[num].prize.levels > 1); puts monster[num]; puts "\n\n" end }
end

#ganar_mas_1_nivel(monster) para utilizar el consultor

#Mostrar todos los monstruos que tengan un mal rollo que suponga la pérdida de un determinado tipo de tesoros ya sea  visibles y/o ocultos
def perder_objeto_especifico(monster, type)
  puts "MONSTRUOS CON LOS QUE PIERDES EL OBJETO ESPECIFICO: #{type} \n\n"
  monster.length.times do |num| 
    if (monster[num].bad_consequence.specific_visible_treasures.detect { |tipo| tipo == type } || 
          monster[num].bad_consequence.specific_hidden_treasures.detect { |tipo| tipo == type  } )
      puts monster[num]
      puts "\n\n" 
    end 
  end
end

#perder_objeto_especifico(monster, TreasureKind::ARMOR) para utilizar el consultor

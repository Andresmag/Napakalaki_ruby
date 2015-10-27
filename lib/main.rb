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
bad_consequence = BadConsequence.new_level_number_of_treasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta",
  0, 1,1)
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
bad_consequence = BadConsequence.new_level_number_of_treasures('Sientes bichos bajo la ropa. Descarta la armadura visible',
  5, 3, 0)
monster << Monster.new('El rey de rosa',13,bad_consequence, prize)

#monster[8]= La que redacta en las tinieblas
prize = Prize.new(1,1)
bad_consequence = BadConsequence.new_level_number_of_treasures('Sientes bichos bajo la ropa. Descarta la armadura visible',
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
  0, [TreasureKind::Onehand] , Array.new )
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
  2, [TreasureKind::Bothhand] , Array.new )
monster << Monster.new('Roboggoth',3,bad_consequence, prize)

monster.length.times do |num|
  puts (monster[num])
  puts "\n\n"
end  

#Consultores de monstruos

#Muestra los monstruos con nivel superior a 10
def monstruos_mas_10(monster)
  monster.length.times { |num| if (monster[num].combat_level > 10); puts monster[num]; puts "\n\n" end }
end

# monstruos_mas_10(monster) para utilizar el consultor
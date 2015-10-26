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
 [TreasureKind::ARMOR] , Array.new )
monster << Monster.new('3 Byahkees de bonanza', 8, bad_consequence, prize)

#monster[1] = Chibithulhu
prize = Prize.new(1, 1);
bad_consequence = BadConsequence.new_level_specific_treasures("Embobados con el lindo primigeniote descartas de tu casco visible",
  0, [TreasureKind::HELMET] , Array.new )
monster << Monster.new('Chibithulhu', 2, bad_consequence, prize)

prize = Prize.new(1, 1);
bad_consequence = BadConsequence.new_level_specific_treasures("El primordial bostezo contagioso. Pierdes el calzado visible",
  0, [TreasureKind::SHOES] , Array.new )
monster << Monster.new('El sopor de Dunwich', 2, bad_consequence, prize)

prize = Prize.new(4,1)
bad_consequence = BadConsequence.new_level_number_of_treasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta",
  0, 1,1)
monster << Monster.new('Angeles de la noche ibicenca', 14, bad_consequence, prize)

monster.length.times do |num|
  puts (monster[num])
  puts "\n\n"
end 

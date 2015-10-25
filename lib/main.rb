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
  [TreasureKind::ARMOR],[TreasureKind::ARMOR])
monster << Monster.new('3 Byahkees de bonanza', 8, bad_consequence, prize)

puts monster[0]
#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#Autors:
# => Andresmag
# => Algebro
  
require_relative 'player.rb'
require_relative 'card_dealer.rb'
require_relative 'dice.rb'
require_relative 'napakalaki.rb'

module NapakalakiGame
  
  #Consultores de monstruos

  #Muestra los monstruos con nivel superior a 10
  def monstruos_mas_10(monster)
    puts "MONSTRUOS CON NIVEL SUPERIOR A 10: \n\n"
    monster.length.times { |num| if (monster[num].combat_level > 10); puts monster[num]; puts "\n\n" end }
  end

  #monstruos_mas_10(monster) para utilizar el consultor

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
    monster.length.times { |num| if (monster[num].get_levels_gained > 1); puts monster[num]; puts "\n\n" end }
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
  
end

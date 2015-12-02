#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'
require_relative 'monster.rb'
require_relative 'prize.rb'
require_relative 'bad_consequence.rb' 
require_relative 'treasure.rb'
require_relative 'treasure_kind.rb'
  
module NapakalakiGame
  
  class CardDealer
    include Singleton

    def initialize
      @used_treasures = Array.new
      @unused_treasures = Array.new
      @used_monsters = Array.new
      @unused_monsters = Array.new
    end
    
    #attr_reader :unused_monsters -> para poder usar los consultores en main
    #aunque en estos habria que cambiar el vector monster por CardDealer.unused_monsters

    def init_treasure_card_deck
      #Como los Arrays ya estan inicializados, introducimos las cartas
      #directamente en unused

      @unused_treasures << Treasure.new("¡Si mi amo!", 4, TreasureKind::HELMET)
      @unused_treasures << Treasure.new("Botas de investigacion", 3, TreasureKind::SHOES)
      @unused_treasures << Treasure.new("Capucha de Cthutlu", 3, TreasureKind::HELMET)
      @unused_treasures << Treasure.new("A prueba de babas", 2, TreasureKind::ARMOR)
      @unused_treasures << Treasure.new("Botas de lluvia acida", 1, TreasureKind::BOTHHANDS)
      @unused_treasures << Treasure.new("Casco minero", 2, TreasureKind::HELMET)
      @unused_treasures << Treasure.new("Ametralladora Thompson", 4, TreasureKind::BOTHHANDS)
      @unused_treasures << Treasure.new("Camiseta de la UGR", 1, TreasureKind::ARMOR)
      @unused_treasures << Treasure.new("Clavo de rail ferroviario", 3, TreasureKind::ONEHAND)
      @unused_treasures << Treasure.new("Cuchillo de sushi arcano", 2, TreasureKind::ONEHAND)
      @unused_treasures << Treasure.new("Fez alopodo", 3, TreasureKind::HELMET)
      @unused_treasures << Treasure.new("Hacha prehistorica", 2, TreasureKind::ONEHAND)
      @unused_treasures << Treasure.new("El aparato del Pr.Tesla", 4, TreasureKind::ARMOR)
      @unused_treasures << Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS)
      @unused_treasures << Treasure.new("Insecticida", 2, TreasureKind::ONEHAND)
      @unused_treasures << Treasure.new("Escopeta de 3 cañones", 4, TreasureKind::BOTHHANDS)
      @unused_treasures << Treasure.new("Garabato mistico", 2, TreasureKind::ONEHAND)
      @unused_treasures << Treasure.new("La rebeca metalica", 2, TreasureKind::ARMOR)
      @unused_treasures << Treasure.new("Lanzallamas", 4, TreasureKind::BOTHHANDS)
      @unused_treasures << Treasure.new("Necrocomicon", 1, TreasureKind::ONEHAND)
      @unused_treasures << Treasure.new("Necronomicon", 5, TreasureKind::BOTHHANDS)
      @unused_treasures << Treasure.new("Linterna a 2 manos", 3, TreasureKind::BOTHHANDS)
      @unused_treasures << Treasure.new("Necrognomicon", 2, TreasureKind::ONEHAND)
      @unused_treasures << Treasure.new("Necrotelecom", 2, TreasureKind::HELMET)
      @unused_treasures << Treasure.new("Mazo de los antiguos", 3, TreasureKind::ONEHAND)
      @unused_treasures << Treasure.new("Necroplayboycon", 3, TreasureKind::ONEHAND)
      @unused_treasures << Treasure.new("Porra preternatural", 2, TreasureKind::ONEHAND)
      @unused_treasures << Treasure.new("Shogulador", 1, TreasureKind::BOTHHANDS)
      @unused_treasures << Treasure.new("Varita de atizamiento", 3, TreasureKind::ONEHAND)
      @unused_treasures << Treasure.new("Tentaculo de pega", 2, TreasureKind::HELMET)
      @unused_treasures << Treasure.new("Zapato deja-amigos", 1, TreasureKind::SHOES)

      #Una vez incluidos todos, los barajamos
      shuffle_treasures
    end

    def init_monster_card_deck
      #Como los Arrays ya estan inicializados, introducimos las cartas
      # directamente en unused

      #monster[0] = 3 Byakhees de bonanza
      prize = Prize.new(2, 1)
      bad_consequence = BadConsequence.new_level_specific_treasures('Pierdes tu armadura visible y otra oculta', 0,
      [TreasureKind::ARMOR] , [TreasureKind::ARMOR]  )
      @unused_monsters << Monster.new('3 Byahkees de bonanza', 8, bad_consequence, prize)

      #monster[1] = Chibithulhu
      prize = Prize.new(1, 1);
      bad_consequence = BadConsequence.new_level_specific_treasures("Embobados con el lindo primigenio te descartas de tu casco visible",
        0, [TreasureKind::HELMET] , Array.new )
      @unused_monsters << Monster.new('Chibithulhu', 2, bad_consequence, prize)

      #monster[2] = El sopor de Dunwich
      prize = Prize.new(1, 1);
      bad_consequence = BadConsequence.new_level_specific_treasures("El primordial bostezo contagioso. Pierdes el calzado visible",
        0, [TreasureKind::SHOES] , Array.new )
      @unused_monsters << Monster.new('El sopor de Dunwich', 2, bad_consequence, prize)

      #monster[3] = Angeles de la noche ibicenca
      prize = Prize.new(4,1)
      bad_consequence = BadConsequence.new_level_specific_treasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta",
        0, [TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
      @unused_monsters << Monster.new('Angeles de la noche ibicenca', 14, bad_consequence, prize)

      #monster[4] = El gorrón en el umbral
      prize = Prize.new(3,1)
      bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes todos tus tesoros visibles', 0, BadConsequence.MAXTREASURES, 0)
      @unused_monsters << Monster.new('El gorron en el umbral',10,bad_consequence, prize)

      #monster[5]= H.P. Munchcraft
      prize = Prize.new(2,1)
      bad_consequence = BadConsequence.new_level_specific_treasures('Pierdes la armadura visible', 0,[TreasureKind::ARMOR] , Array.new )
      @unused_monsters << Monster.new('H.P. Munchcraft',6,bad_consequence, prize)

      #monster[6]= Bichgooth
      prize = Prize.new(1,1)
      bad_consequence = BadConsequence.new_level_specific_treasures('Sientes bichos bajo la ropa. Descarta la armadura visible',
        0, [TreasureKind::ARMOR] , Array.new )
      @unused_monsters << Monster.new('Bichgooth',2,bad_consequence, prize)

      #monster[7]= El rey de rosa
      prize = Prize.new(4,2)
      bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes 5 niveles y 3 tesoros visibles',
        5, 3, 0)
      @unused_monsters << Monster.new('El rey de rosa',13,bad_consequence, prize)

      #monster[8]= La que redacta en las tinieblas
      prize = Prize.new(1,1)
      bad_consequence = BadConsequence.new_level_number_of_treasures('Toses los pulmones y pierdes 2 niveles',
        2, 0, 0)
      @unused_monsters << Monster.new('La que redacta en las tinieblas',2,bad_consequence, prize)

      #monster[9]= Los hondos
      prize = Prize.new(2,1)
      bad_consequence = BadConsequence.new_death('Estos monstruos resultan bastante superficiales y te aburren moralmente. Estas muerto') 
      @unused_monsters << Monster.new('Los hondos',8,bad_consequence, prize)

      #monster[10]= Semillas Cthulhu
      prize = Prize.new(2,1)
      bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes 2 niveles y 2 tesoros ocultos',
        2, 0, 2)
      @unused_monsters << Monster.new('Semillas Cthulhu',4,bad_consequence, prize)

      #monster[11]= Dameargo
      prize = Prize.new(2,1)
      bad_consequence = BadConsequence.new_level_specific_treasures('Te intentas escaquear. Pierdes una mano visible',
        0, [TreasureKind::ONEHAND] , Array.new )
      @unused_monsters << Monster.new('Dameargo',1,bad_consequence, prize)

      #monster[12]= Pollipólipo volante
      prize = Prize.new(1,1)
      bad_consequence = BadConsequence.new_level_number_of_treasures('Da mucho asquito. Pierdes 3 niveles',
        3, 0, 0)
      @unused_monsters << Monster.new('Pollipolipo volante',3,bad_consequence, prize)

      #monster[13]= Yskhtihyssg-Goth
      prize = Prize.new(3,1) 
      bad_consequence = BadConsequence.new_death('No le hace gracia que pronuncien mal su nombre. Estas muerto') 
      @unused_monsters << Monster.new('Yskhtihyssg-Goth',12,bad_consequence, prize)

      #monster[14]= Familia feliz
      prize = Prize.new(4,1) 
      bad_consequence = BadConsequence.new_death('La familia te atrapa. Estas muerto') 
      @unused_monsters << Monster.new('Familia feliz',1,bad_consequence, prize)

      #monster[15]= Roboggoth
      prize = Prize.new(2,1)
      bad_consequence = BadConsequence.new_level_specific_treasures('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible',
        2, [TreasureKind::BOTHHANDS] , Array.new )
      @unused_monsters << Monster.new('Roboggoth',8,bad_consequence, prize)

      #monster[16]= El espia
      prize = Prize.new(1,1)
      bad_consequence = BadConsequence.new_level_specific_treasures('Te asusta por la noche. Pierdes un casco visible',
        0, [TreasureKind::HELMET] , Array.new )
      @unused_monsters << Monster.new('El espia',5,bad_consequence, prize)

      #monster[17]= El lenguas
      prize = Prize.new(1,1)
      bad_consequence = BadConsequence.new_level_number_of_treasures('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.',
       2, 5, 0)
      @unused_monsters << Monster.new('El lenguas',20,bad_consequence, prize)

      #monster[18]= El bicéfalo
      prize = Prize.new(1,1)
      bad_consequence = BadConsequence.new_level_specific_treasures('Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos',
        3, [TreasureKind::ONEHAND,TreasureKind::ONEHAND,TreasureKind::BOTHHANDS] , Array.new )
      @unused_monsters << Monster.new('Bicefalo',20,bad_consequence, prize)

      #Una vez incluidos todos, los barajamos
      shuffle_monsters
    end

    def shuffle_treasures
      @unused_treasures.shuffle!
    end

    def shuffle_monsters
      @unused_monsters.shuffle!
    end

    def next_treasure
      if(@unused_treasures.empty?)
        #Lo volvemos a rellenar si se puede
        if(!@used_treasures.empty?)
          @used_treasures.each do |treasure|
            @unused_treasures << treasure
          end
          
          #Lo volvemos a barajar
          shuffle_treasures

          #Limpiamos el mazo de descartes
          @used_treasures.clear 
        else
          puts "No hay cartas tampoco en el mazo de descartes"
          t = nil
        end
      end
      
      if(!@unused_treasures.empty?)
        #Cojemos el primero
        t = @unused_treasures[0]

        #Y lo quitamos del mazo de donde se cogen para evitar repetirlo
        @unused_treasures.delete(t)    
      end
      t
    end

    def next_monster
      if(@unused_monsters.empty?)
        #Lo volvemos a rellenar
        @used_monsters.each do |monster|
          @unused_monsters << monster
        end

        #Lo volvemos a barajar
        shuffle_monsters

        #Limpiamos el mazo de descartes
        @used_monsters.clear
      end

      #Cojemos el primero
      m = @unused_monsters[0]

      #Lo añadimos al mazo de descartes para no volver a cogerlo
      give_monster_back(m)

      #Y lo quitamos del mazo de donde se cogen para evitar repetirlo
      @unused_monsters.delete(m)

      m    
    end

    def give_treasure_back(t)
      @used_treasures << t
    end

    def give_monster_back(m)
      @used_monsters << m
    end

    def init_cards
      init_treasure_card_deck
      init_monster_card_deck
    end

  end
  
end
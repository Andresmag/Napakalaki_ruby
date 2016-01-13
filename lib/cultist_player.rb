# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'player.rb'
require_relative 'cultist.rb'

module NapakalakiGame


  class CultistPlayer < Player
    @@total_cultist_player = 0;
    def initialize (player,card)
      @@total_cultist_player += 1
      super(player.name)
      cp_player(player)
      @my_cultist_card = card
      puts @my_cultist_card.to_s
    end

    attr_reader :my_cultist_card, :total_cultist_player


    def get_combat_level
      suma = super * 1.2
      suma += @my_cultist_card.gained_levels * @@total_cultist_player
      suma.floor
    end

    def should_convert
      false
    end

    def get_oponent_level(m )
      m.get_level_change_against_cultist_player
    end

    def give_me_a_treasure
      pos_aleatoria = rand(@visible_treasures.length )
      lost_treasure = @visible_treasures[pos_aleatoria]
      @visible_treasures.delete(lost_treasure)
      lost_treasure
    end   

    def can_you_give_me_a_treasure
      !@visible_treasures.empty?
    end


    def to_s
      resp = super
      resp +=  "\nJUGADOR SECTARIO \n"
    end

  end
end

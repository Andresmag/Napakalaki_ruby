# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame


class Cultist_Player < Player
  @@total_cultist_player = 0;
  
  @override
  def initialize (player,card)
    @@total_cultist_player += 1
    super.cp_player(player)
    @my_cultist_card = card
  end
  
  attr_reader :my_cultist_card, :total_cultist_player
  
  
   @Override
   def get_combat_level
      suma = super.get_combat_level * 1.2
      suma += @my_cultist_card.gained_levels * @@total_cultist_player
      suma
   end
  
    @Override
    def should_convert
        false
    end
  
    @Override
    def get_oponent_level(m )
        m.level_change_against_cultist_player
    end
    
    @Override
    def give_me_a_treasure
      pos_aleatoria = rand(@visible_treasures.length )
      lost_treasure = @visible_treasures[pos_aleatoria]
      @visible_treasures.delete(lost_treasure)
      lost_treasure
    end   
    
    @Override
    def can_you_give_me_a_treasure
      !@visible_treasures.empty?
    end
    
    @Override
    def to_s
        resp =  super.to_s + "\nJUGADOR SECTARIO \n"
        resp
    end
    
end

end

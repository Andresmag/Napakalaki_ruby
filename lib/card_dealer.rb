# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

include Singleton

class CardDealer
  @@instance = nil
  def initialize
    
  end
  
  attr_reader :instance
  attr_reader :used_treasures, :unused_treasures , :used_monsters , :unused_monsters
  
  def init_treasure_card_deck
  end
  
  def init_monster_card_deck
  end
  
  def suffle_treasures
  end
  
  def suffle_monsters
  end
  
  def next_treasure
  end
  
  def next_monster
        if(unusedMonsters.isEmpty())
            #Lo volvemos a rellenar
            used_monster.length.times do |num|
                unused_monsters.add(used_monster.get(num))
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

#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
  
  class Player
    MAXLEVEL = 10
    def initialize(a_name)
      @name = a_name
      @level = 1
      @dead = true
      @can_I_steal = true
      @enemy = nil
      @visible_treasures = Array.new
      @hidden_treasures = Array.new
      @pending_bad_consequence = nil
    end

    attr_reader :name
    attr_accessor :dead, :level, :pending_bad_consequence, :enemy
    attr_accessor :hidden_treasures, :visible_treasures, :can_I_steal


    private
    def bring_to_life
      @dead = false
    end

    def get_combat_level
      combat_level = @level
      @visible_treasures.each do |treasure|
        combat_level += treasure.bonus 
      end
      combat_level
    end

    def increment_levels(i)
      @level += i
    end

    def decrement_levels(i)
      @level -= i
      @level = 1 if (@level <= 0)
    end

    def set_pending_bad_consequence(b)
      @pending_bad_consequence = b
    end

    def apply_prize(m)
      incremet_levels(m.get_levels_gained())
    end

    def apply_bad_consequence(m)
      if(m.bad_consequence.death)
         @dead = true
      else
        decrement_levels(m.bad_consequence.levels)
      end
    end

    
    def can_make_treasures_visible(t)
      puede_equipar
      tipo_objeto = t.type
      
      case tipo_objeto
      when TreasureKind::HELMET
        puede_equipar = !(@visible_treasures.detect{ |tipo| tipo == tipo_objeto })
      when TreasureKind::ARMOR
        puede_equipar = !(@visible_treasures.detect{ |tipo| tipo == tipo_objeto })
      when TreasureKind::SHOES
        puede_equipar = !(@visible_treasures.detect{ |tipo| tipo == tipo_objeto })
      when TreasureKind::BOTHHANDS
        puede_equipar = !(@visible_treasures.detect{ |tipo| tipo == tipo_objeto } || 
                           @visible_treasures.detect{ |tipo| tipo == TreasureKind::ONEHAND})
      when TreasureKind::ONEHAND
        puede_equipar = !(@visible_treasures.detect{ |tipo| tipo == TreasureKind::BOTHHANDS})
        if(puede_equipar)
          una_mano = 0  #Contador para ver cuantos tesoros OneHand lleva equipados
          @visible_treasures.each do |treasure|  
            una_mano += 1 if (treasure.type == TreasureKind::ONEHAND)
          end
          
          puede_equipar = (una_mano < 2)
        end
                          
      end
      
      puede_equipar
    end

    def how_many_visible_treasures(tKind)
      contador = 0
      @visible_treasures.each do |treasure| 
        contador += 1 if (treasure.type == tKind) 
      end
      contador
    end

    def die_if_no_treasures()
      @dead = true if (@visible_treasures.empty? && @hidden_treasures.empty?)
    end

    public
    #def combat(m)
      #por implementar
    #end

    def make_treasure_visible(t)
      if(can_make_treasures_visibles(t))
        @visible_treasures << t
        @hidden_treasures.delete(t)
      end
    end

    def discard_visible_treasure(t)
      @visible_treasures.delete(t)
    end

    def discard_hidden_treasures(t)
      @hidden_treasures.delete(t)
    end

    def valid_state
      valid = false
      valid = true if (@pending_bad_consequence == nil && @hidden_treasures < 5)
      valid
    end

    #def init_treasures
      #por implementar
    #end

    #def steal_treasure
      #por implementar
    #end

    def discard_all_treasures
      @visible_treasures.clear
      @hidden_treasures.clear
    end

    private
    def give_me_a_treasure
      treasure = nil
      if(can_you_give_me_a_treasure)
        treasure = @enemy.hidden_treasures[rand(@enemy.hidden_treasures.length)]
      end
      treasure
    end
      

    def can_you_give_me_a_treasure
      can_steal = false
      can_steal = true if (@enemy.hidden_treasures.length > 0)
      can_steal
    end

    def have_stolen
      @can_I_steal = false
    end
  end
  
end
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

    #Para este metodo vamos a crear un vector local al metodo,
    #en el que cada casilla haga referencia a un tipo concreto de tesoro 
    #que el jugador tenga equipado. De la siguiente manera
    #Posiciones:
    # => 0 = Helmet
    # => 1 = Armor
    # => 2 = Shoes
    # => 3 = BothHands
    # => 4 = OneHand
    # => 5 = OneHand
    #Cada casilla contendra TRUE en caso de que el jugador tenga equipado
    #un objeto del tipo especifico para el que es cada casilla
    def can_make_treasures_visible(t)
      puede_equipar = true
      tipo_objeto = t.type
      equipado = Array.new(5, false)
      una_mano = 0  #Contador para ver cuantos tesoros OneHand lleva equipados
      @visible_treasures.each do |treasure|
        case treasure.type
        when TreasureKind::HELMET
          equipado[0] = true
        when TreasureKind::ARMOR
          equipado[1] = true
        when TreasureKind::SHOES
          equipado[2] = true
        when TreasureKind::BOTHHANDS
          equipado[3] = true
        when TreasureKind::ONEHAND
          if(una_mano == 0)
            equipado[4] = true
            una_mano += 1
          else
            equipado[5] = true
          end
        end
      end
      
      #Una vez rellenado el vector de booleanos con lo que tiene el jugador 
      #equipado, comparamos con el tipo de objeto que queremos equipar,
      #si su casilla esta en false, y se cumplen los requisitos, entonces
      #el jugador podra equiparse el tesoro
      
      case tipo_objeto
      when TreasureKind::HELMET
        puede_equipar = false if(equipado[0])
      when TreasureKind::ARMOR
        puede_equipar = false if(equipado[1])
      when TreasureKind::SHOES
        puede_equipar = false if(equipado[2])
      when TreasureKind::BOTHHANDS
        puede_equipar = false if(equipado[3] || equipado[4] || equipado[5])
      when TreasureKind::ONEHAND
        puede_equipar = false if(equipado[3] || (equipado[4] && equipado[5]))
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
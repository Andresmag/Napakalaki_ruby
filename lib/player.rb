#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
  
require_relative 'treasure.rb'
require_relative 'bad_consequence.rb'
require_relative 'dice.rb'
require_relative 'card_dealer.rb'
require_relative 'combat_result.rb'

module NapakalakiGame
  
  class Player
   @@MAXLEVEL = 10
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

    attr_reader :name, :dead, :hidden_treasures, :visible_treasures, :level
    attr_reader :can_I_steal, :pending_bad_consequence
    attr_accessor :enemy  


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

    def apply_prize(m)
      increment_levels(m.get_levels_gained())
      if(m.get_treasures_gained > 0) then
        dealer = CardDealer.instance
        m.get_treasures_gained.times do |treasure|
          treasure = dealer.next_treasure
          if(treasure != nil) then
            @hidden_treasures << treasure
          end
        end
      end
    end

    def apply_bad_consequence(m)
      bad_consequence = m.bad_consequence
      decrement_levels(bad_consequence.levels)
      bad = bad_consequence.adjust_to_fit_treasure_lists(@visible_treasures, 
        @hidden_treasures)
    
      @pending_bad_consequence = bad
    end
    
    def can_make_treasure_visible(t)
      puede_equipar = false
      case t.type
      when TreasureKind::ONEHAND
        puede_equipar = true if((how_many_visible_treasures(t.type) < 2) && 
            (how_many_visible_treasures(TreasureKind::BOTHHANDS) == 0))
        
      when TreasureKind::BOTHHANDS
        puede_equipar = true if((how_many_visible_treasures(TreasureKind::ONEHAND) == 0) && 
            (how_many_visible_treasures(t.type) == 0))
        
      else
        puede_equipar = !(how_many_visible_treasures(t.type) == 1)
      end
      
      puede_equipar
    end

    def how_many_visible_treasures(tKind)
      contador = 0
      @visible_treasures.each do |treasure| 
        contador += 1 if(treasure.type == tKind)
      end
      contador
    end

    def die_if_no_treasures()
      @dead = true if (@visible_treasures.empty? && @hidden_treasures.empty?)
    end

    public
    def self.MAXLEVEL
      @@MAXLEVEL
    end
    
    def combat(m)
     my_level = get_combat_level
     monster_level = m.combat_level
     resultado_combate = nil
     
      if(my_level > monster_level) then
        apply_prize(m)
        if(@level >= @@MAXLEVEL) then
          resultado_combate = CombatResult::WINGAME
        else
          resultado_combate = CombatResult::WIN
        end
        
      else
        apply_bad_consequence(m)
        resultado_combate = CombatResult::LOSE
        
      end
      
      resultado_combate
    end

    def make_treasure_visible(t)
      if(can_make_treasure_visible(t))
        @visible_treasures << t
        @hidden_treasures.delete(t)
      end
    end

    def discard_visible_treasure(t)
      @visible_treasures.delete(t)
      if(@pending_bad_consequence != nil && !@pending_bad_consequence.is_empty) then
        @pending_bad_consequence.substract_visible_treasure(t)
      end
      
      #Lo llevamos al mazo de descartes
      dealer = CardDealer.instance
      dealer.give_treasure_back(t)
      
      die_if_no_treasures
    end

    def discard_hidden_treasure(t)
      @hidden_treasures.delete(t)
      if(@pending_bad_consequence != nil && !@pending_bad_consequence.is_empty) then
        @pending_bad_consequence.substract_hidden_treasure(t)
      end
      
      #Lo llevamos al mazo de descartes
      dealer = CardDealer.instance
      dealer.give_treasure_back(t)
      
      die_if_no_treasures
    end

    def valid_state
      valid = ((@pending_bad_consequence == nil || @pending_bad_consequence.is_empty) && 
          @hidden_treasures.length < 5)
      valid
    end

    def init_treasures
      dealer = CardDealer.instance
      dice = Dice.instance
      
      bring_to_life
      
      treasure = dealer.next_treasure
      @hidden_treasures << treasure

      
      number = dice.next_number
      if (number > 1) then
        treasure = dealer.next_treasure
        @hidden_treasures << treasure
      end
      
      if(number == 6) then
        treasure = dealer.next_treasure
        @hidden_treasures << treasure
      end
      
      @hidden_treasures.compact!#Lo compruebo porque si en next_treasure 
      #no se puede devolver ningun tesoro, devuelve nil 
      #y se añadiria un nil al vector. Con este metodo eliminamos los nils
      #que pueda haber
      
      die_if_no_treasures #En caso de que al ir a robar no haya cartas ni en 
      #unused_treasures, ni en used_treasures,
      # el jugador deberia volver al estado de muerto ya que no tiene tesoros
    end

    def steal_treasure
      treasure = nil
      if(can_I_steal)
        if(can_you_give_me_a_treasure)
          treasure = give_me_a_treasure
          @hidden_treasures << treasure
          have_stolen
        end
      end
      treasure
    end

    def discard_all_treasures
      while(!@visible_treasures.empty?)
        t = @visible_treasures[0]
        discard_visible_treasure(t)
      end
      
      while(!@hidden_treasures.empty?)
        t = @hidden_treasures[0]
        discard_hidden_treasure(t)
      end
    end

    private
    def give_me_a_treasure
      treasure = nil
      if(can_you_give_me_a_treasure)
        treasure = @enemy.hidden_treasures[rand(@enemy.hidden_treasures.length)]
        @enemy.discard_hidden_treasure(treasure)
      end
      treasure
    end
      

    def can_you_give_me_a_treasure
      can_steal = (@enemy.hidden_treasures.length > 0)
      can_steal
    end

    def have_stolen
      @can_I_steal = false
    end
    
    public
    #Añadida para el buen funcionamiento
    def to_s
      resp = name
      resp += "\n Nivel -> #{level}"
      resp += "\n Nivel de combate -> #{get_combat_level}" 
      if(can_I_steal) then
        resp += "\n Enemigo -> #{enemy.name}"
      end
      if(dead) then
        resp += "\n Jugador muerto"
      else
        resp += "\n Jugador vivo"
      end
      
      #Si no tiene bad_consequence o este ya está vacio bien porque lo ha 
      #completado o bien porque no tiene los tesoros que pedía y el ajuste 
      #lo deja vacio entonces no lo mostramos
      if(@pending_bad_consequence != nil && !@pending_bad_consequence.is_empty )
        resp += "\n" + @pending_bad_consequence.to_s
      end
      resp
    end
  end
  
end
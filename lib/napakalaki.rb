#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


require 'singleton'
require_relative 'combat_result.rb'
require_relative 'player.rb'
require_relative 'card_dealer.rb'
require_relative 'monster.rb'
require_relative 'cultist_player.rb'

module NapakalakiGame

  class Napakalaki
    include Singleton

    def initialize
      @current_monster = nil
      @current_player = nil
      @dealer = CardDealer.instance
      @players = Array.new
    end

    attr_reader :current_monster, :current_player
    
    private
    def init_players(names)
      if(!names.empty?)
        names.each do |name|
          new_player = Player.new_player(name)
          @players << new_player
        end
      end

    end

    def next_player
      jugador_siguiente = nil
      
      if(@current_player == nil) then
        num_aleatorio = rand(@players.length)
        jugador_siguiente = @players[num_aleatorio]
      else
        num = 0
        while (@players[num] != @current_player)
          num += 1
        end
        
        if(num == @players.length-1)
          jugador_siguiente = @players[0]
        else
          jugador_siguiente = @players[num+1]
        end
      end
      
      jugador_siguiente
    end

    def next_turn_allowed
      se_puede_pasar = nil
      if(@current_player == nil) #Cuando es el primer turno
        se_puede_pasar = true
      else
        se_puede_pasar = @current_player.valid_state
      end
      
      se_puede_pasar
    end

    def set_enemies
      contador = 0
      @players.each do |player|
        while((num = rand(@players.length)) == contador)
          num = rand(@players.length)
        end
        
        @players[contador].enemy = @players[num]
        contador += 1
      end
    end
    
    public
    def develop_combat
      resultado = @current_player.combat(@current_monster)
      @dealer.give_monster_back(@current_monster)
      if(resultado==CombatResult::LOSEANDCONVERT) then
        cultistc = @dealer.next_cultist
        cultist = CultistPlayer.new(@current_player, cultistc)
        @players[@players.index(@current_player)] = cultist     
        @players.each do |player|
          if (player.enemy == @current_player) then
            player.enemy = cultist
          end
        end
        @current_player = cultist
      end
      resultado
    end

    def discard_visible_treasures(treasures)
      copia = Array.new(treasures)
      i=0
      while(i < copia.length)
        treasure = treasures[i]
        @current_player.discard_visible_treasure(treasure)
        @dealer.give_treasure_back(treasure)
        i += 1
      end      
    end

    def discard_hidden_treasures(treasures)
      copia = Array.new(treasures)
      i = 0
      while(i < copia.length)
        treasure = treasures[0]
        @current_player.discard_hidden_treasure(treasure)
        @dealer.give_treasure_back(treasure)
        i += 1
      end
    end

    def make_treasures_visible(treasures)
      treasures.each do |treasure|
        @current_player.make_treasure_visible(treasure)
      end
    end

    def initGame (players)
      init_players(players)
      set_enemies
      @dealer.init_cards
      next_turn

    end

    def next_turn
      state_ok = next_turn_allowed
      if(state_ok) then
        @current_monster = @dealer.next_monster
        @current_player = next_player
        
        if(@current_player.dead) then
          @current_player.init_treasures
        end
      end
      state_ok
    end

    def end_of_game (result)
      fin = (result == CombatResult::WINGAME)
      fin
    end
  end
end

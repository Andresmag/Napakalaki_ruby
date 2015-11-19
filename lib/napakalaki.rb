#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


module Napakalaki

  require 'singleton'
  require_relative 'combat_result.rb'
  require_relative 'player.rb'
  require_relative 'card_dealer.rb'
  require_relative 'monster.rb'

  class Napakalaki
    include Singleton

      def initialize
      @current_monster = nil
      @current_player = nil
      @dealer = nil
      @players = Array.new
    end

    attr_reader :current_monster, :current_player
    
    private
    def init_players(names)
      if(!names.empty?)
        names.each do |name|
          new_player = Player.new(name)
          @players << new_player
        end
      end

    end

    def next_player
      if(@current_player == nil) then
        num_aleatorio = rand(@players.length)
        @current_player = @players[num_aleatorio]
        
      else
        num = 0
        while (@players[num] != @current_player)
          num += 1
        end
        
        if(num == @players.length-1)
          @current_player = @players[0]
        else
          @current_player = @players[num+1]
        end
      end
      
      @current_player
    end

    def next_turn_allowed
      se_puede_pasar = @current_player.valid_state
      se_puede_pasar
    end

    def set_enemies
      contador = 0
      @players.each do |player|
        while(num = rand(@players.length) == contador)
          num = rand(@players.length)
        end
        
        player.enemy = @players[num]
        contador += 1
      end
    end
    
    public
    def develop_combat

    end

    def discard_visible_treasures

    end

    def discard_hidden_treasures

    end

    def make_treasures_visible

    end

    def init_game (players)

    end

    def next_turn

    end

    def end_of_game (result)
      fin = false
      fin = true if(result == CombatResult::WINGAME)
      fin
    end

  end

end

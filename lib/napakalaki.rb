#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'

class Napakalaki
  include Singleton
  
    def initialize
    @current_monster = nil
    @current_player = nil
    @dealer = nil
    @players = Array.new
  end
  
  attr_reader :current_monster, :current_player, :dealer, :players  
  
  def init_players(names)
   
  end
  
  def next_player
    
  end
  
  def next_turn_allowed
   
  end
  
  def set_enemies
    
  end
  
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
  
  def get_current_player
    @current_player
  end
  
  def get_current_monster
      @current_monster
  end
  
  def next_turn
    
  end
  
  def end_of_game (result)
    
  end
  
end

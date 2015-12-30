#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
  
require_relative 'bad_consequence.rb'
require_relative 'prize.rb'
  
module NapakalakiGame
  
  class Monster
    def initialize(new_name, level, bc, prize, ic=0)
      @name = new_name
      @combat_level = level
      @bad_consequence = bc
      @prize = prize
      @level_change_against_cultist_player = ic
      
    end

    attr_reader :name, :combat_level, :bad_consequence

    def get_levels_gained
      @prize.levels
    end

    def get_treasures_gained
      @prize.treasures
    end
    
    def  get_level_change_against_cultist_player
      @combat_level + @level_change_against_cultist_player
    end

    #Metodo toString para mostrar por pantalla los atributos de la clase
    def to_s
      "\nNombre: #{name} \tNivel: #{combat_level} \n" + 
        "Niveles que ganas: #{get_levels_gained}" + 
        "\tTesoros que ganas: #{get_treasures_gained}" +
        "\nMal rollo: " + bad_consequence.to_s
    end
  end
  
end
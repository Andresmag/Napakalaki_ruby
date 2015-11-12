#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
  
  class Monster
    def initialize(new_name, level, bc, prize)
      @name = new_name
      @combat_level = level
      @bad_consequence = bc
      @prize = prize
    end

    attr_reader :name, :combat_level, :bad_consequence

    def get_levels_gained
      @prize.levels
    end

    def get_treasures_gained
      @prize.treasures
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
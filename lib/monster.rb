#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require './Prize'
require './bad_consequence.rb'

class Monster
  def initialize(new_name, level, bc, prize)
    @name = new_name
    @combat_level = level
    @bad_consequence = bc
    @prize = prize
  end
  
  attr_reader :name
  attr_reader :combat_level
  attr_reader :prize
  attr_reader :bad_consequence
  
  #Metodo toString para mostrar por pantalla los atributos de la clase
  def to_s
    "Nombre: #{@name} \tNivel: #{@combat_level} \n" + 
      @prize.to_s + "\nMal rollo: " + @bad_consequence.to_s
  end
end

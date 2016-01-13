# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame

  class Cultist
    def initialize(name, gained_levels)
      @name = name
      @gained_levels = gained_levels
    end

   attr_reader :name, :gained_levels
   
    def to_s
      resp = "\nNombre de sectario: #{@name}"
      resp += "\nNiveles que ganas por cada sectario en juego: #{@gained_levels}"
      resp
    end
  end

end
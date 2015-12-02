#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
 

module NapakalakiGame
  
  class Prize
    def initialize(num_treasures, num_levels)
      @treasures = num_treasures
      @levels = num_levels
    end

    attr_reader :treasures, :levels

    #Metodo toString para mostrar por pantalla los atributos de la clase
    def to_s 
      resp = "Tesoros ganados: #{@treasures} \nNiveles ganados: #{@levels}"

      resp
    end 

  end

end

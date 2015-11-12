#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


module Napakalaki
  
  class Treasure
    def initialize(new_name, num_bonus, type)
      @name = new_name
      @bonus = num_bonus
      @type = type
    end

    attr_reader :name, :bonus, :type

    def to_s
      resp = "\nNombre del tesoro: #{@name}"
      @type_visible = @type.to_s
      resp += "\nTipo de tesoro: #{@type_visible[2, @type_visible.length-3]}"
      resp += "\nBonificacion otorgda: #{@bonus}"

      resp
    end
  end
  
end

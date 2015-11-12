#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki

require 'singleton'

 class Dice
   include Singleton
    
   def next_number
     num_aleatorio = rand(6)+1
     num_aleatorio
   end

   def to_s
     resp = "Numero obtenido: #{next_number}"
     resp
   end
  end
  
end

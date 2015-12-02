#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'

module NapakalakiGame

 class Dice
   include Singleton
    
   def next_number
     num_aleatorio = rand(6)+1
     num_aleatorio
   end

  end
  
end

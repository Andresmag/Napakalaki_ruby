# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

include Singleton

class Dice
  @@instance = nil
  def initialize
    
  end
  
  attr_reader :instance
  
  def next_number()
    num_aleatorio = rand(6)+1
    num_aleatorio
  end
  
  def to_s
    resp = "Numero obtenido: #{@@instance}"
    resp
  end
end

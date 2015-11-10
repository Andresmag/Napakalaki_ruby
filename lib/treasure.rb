# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Treasure
  def initialize(new_name, num_bonus, type)
    @name = new_name
    @bonus = num_bonus
    @type = type
  end
  
  attr_reader :name, :bonus, :type
  
  def to_s
    resp = "Nombre del tesoro: #{@name} \nTipo de tesoro: #{@type} 
        \nBonificacion otorgda: #{@bonus}"
    
    resp
  end
end

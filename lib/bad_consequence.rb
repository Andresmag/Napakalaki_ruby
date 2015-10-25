#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
  
  def initialize(a_text, some_levels, some_visible_treasures, 
      some_hidden_treasures, some_specific_visible_treasures,
      some_specific_hidden_treasures, death) 
    
        @text = a_text
        @levels = some_levels
        @n_visible_treasures = some_visible_treasures
        @n_hidden_treasures = some_hidden_treasures
        @death = death
        
        @specific_visible_treasures = some_specific_visible_treasures
        @specific_hidden_treasures = some_specific_hidden_treasures
    
  end
  
  attr_reader :text
  attr_reader :levels
  attr_reader :n_visible_treasures, :n_hidden_treasures
  attr_reader :death
  
  attr_reader :specific_visible_treasures, :specific_hidden_treasures
  
  #Metodos que sobrecarga el constructor
  private_class_method :new
  
  def BadConsequence.new_level_number_of_treasures(a_text, some_levels, 
      some_visible_treasures, some_hidden_treasures) 
      
    new(a_text, some_levels, some_visible_treasures, some_hidden_treasures, false, Array.new, Array.new)
    
  end
  
  def BadConsequence.new_level_specific_treasures(a_text, some_levels, 
      some_specific_visible_treasures, some_specific_hidden_treasures)
    
    new(a_text, some_levels, 0, 0, false, some_specific_visible_treasures, some_specific_hidden_treasures)
  end
  
  def BadConsequence.new_death(a_text)
    new(a_text, 0, 0, 0, true, Array.new, Array.new)
  end
  
  #Metodo toString para mostrar los atributos de la clase por pantalla
  def to_s
    #Para que muestre si o no, en lugar de true o false
    resp = @text
    
    if death == true
      resp += "\nEstas muerto"
    else
      resp += "\nNiveles que pierdes: #{@levels} \nTesoros perdidos: \n\t -> Visibles = #{@n_visible_treasures} \n\t -> Ocultos = #{@n_hidden_treasures}
    \nTesoros especificos perdidos: \n\t -> Visibles = " + @specific_visible_treasures.to_s + "\n\t -> Ocultos = " + @specific_hidden_treasures.to_s
    end
    
    resp #Es lo que devuelve
  end
end
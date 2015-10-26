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
      
    new(a_text, some_levels, some_visible_treasures, some_hidden_treasures, Array.new, Array.new, false)
    
  end
  
  def BadConsequence.new_level_specific_treasures(a_text, some_levels, 
      some_specific_visible_treasures, some_specific_hidden_treasures)
    
    new(a_text, some_levels, 0, 0, some_specific_visible_treasures, some_specific_hidden_treasures, false)
  end
  
  def BadConsequence.new_death(a_text)
    new(a_text, 0, 0, 0, Array.new, Array.new, true)
  end
  
  #Metodo toString para mostrar los atributos de la clase por pantalla
  def to_s
    #Para que muestre si o no, en lugar de true o false
    resp = @text
    
    if death == true
      resp += "\nEstas muerto"
    else
      @specific_visible_sin_corchetes = @specific_visible_treasures.to_s  #Strings para quitar [:...] posteriormente
      @specific_hidden_sin_corchetes = @specific_hidden_treasures.to_s
      
      resp += "\nNiveles que pierdes: #{@levels} \nTesoros perdidos: \n\t -> Visibles = #{@n_visible_treasures} \n\t -> Ocultos = #{@n_hidden_treasures}
      \nTesoros especificos perdidos: \n\t -> Visibles = " + @specific_visible_sin_corchetes[2, @specific_visible_sin_corchetes.length-3] + 
      "\n\t -> Ocultos = " + @specific_hidden_sin_corchetes[2, @specific_hidden_sin_corchetes.length-3]
    end
    
    resp #Es lo que devuelve
  end
end
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
 
     resp += "\nNiveles que pierdes: #{@levels}" if @levels != 0
      
      if @n_visible_treasures != 0 || @n_hidden_treasures != 0
        resp += "\nTesoros perdidos: "
        resp += "\n\t -> Visibles = #{@n_visible_treasures}" if @n_visible_treasures != 0
        resp += "\n\t -> Ocultos = #{@n_hidden_treasures}" if @n_hidden_treasures != 0
      end
      
      if !@specific_hidden_treasures.empty? || !@specific_visible_treasures.empty?
        resp +="\nTesoros especificos perdidos:"
        unless @specific_visible_treasures.empty?
          @string_specific_visible = @specific_visible_treasures.to_s
          resp += "\n\t -> Visibles = " + @string_specific_visible[2, @string_specific_visible.length-3]
        end
        unless @specific_hidden_treasures.empty?
          @string_specific_hidden = @specific_hidden_treasures.to_s
          resp += "\n\t -> Ocultos = " + @string_specific_hidden[2, @string_specific_hidden.length-3]
        end
      end  
    end
    
    resp #Es lo que devuelve
  end
end

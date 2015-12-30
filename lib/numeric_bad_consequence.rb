# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  
  
  class NumericBadConsequence < BadConsequence
    def initialize(a_text, some_levels, some_visible_treasures, 
        some_hidden_treasures, some_specific_visible_treasures,
        some_specific_hidden_treasures, death)
      
      super.initialize(a_text, some_levels, some_visible_treasures, 
        some_hidden_treasures, some_specific_visible_treasures,
        some_specific_hidden_treasures, death)
      
    end
    
    #Metodos que sobrecarga el constructor
    private_class_method :new
    
    def NumericBadConsequence.new_level_number_of_treasures(a_text, some_levels, 
        some_visible_treasures, some_hidden_treasures) 

      new(a_text, some_levels, some_visible_treasures, some_hidden_treasures, Array.new, Array.new, false)

    end
    
  end
end

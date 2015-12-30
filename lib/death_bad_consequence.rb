# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  class DeathBadConsequence < NumericBadConsequence
    def initialize(a_text, some_levels, some_visible_treasures, 
        some_hidden_treasures, some_specific_visible_treasures,
        some_specific_hidden_treasures, death)
      
      super.initialize(a_text, some_levels, some_visible_treasures, 
        some_hidden_treasures, some_specific_visible_treasures,
        some_specific_hidden_treasures, death)
      
    end
    
    #Metodos que sobrecarga el constructor
    private_class_method :new

    def DeathBadConsequence.new_death(a_text)
      new(a_text, Player.MAXLEVEL, @@MAXTREASURES, @@MAXTREASURES, Array.new, Array.new, true)
    end
  end
end

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  
  
  class NumericBadConsequence < BadConsequence
    attr_reader :n_visible_treasures, :n_hidden_treasures
    def initialize(a_text, some_levels, some_visible_treasures,
        some_hidden_treasures)
      super(a_text, some_levels)
      @n_visible_treasures = some_visible_treasures
      @n_hidden_treasures = some_hidden_treasures
    end
    public_class_method :new
    
    def is_empty
      empty = (@n_visible_treasures == 0 && @n_hidden_treasures == 0)
      empty
    end
    
    def substract_visible_treasure(t=nil)
      if(@n_visible_treasures > 0) then
        @n_visible_treasures -= 1
      end
    end
    
    def substract_hidden_treasure(t=nil)
      if(@n_hidden_treasures > 0) then
        @n_hidden_treasures -= 1
      end
    end
    
    def adjust_to_fit_treasure_lists(v, h)
      if(@n_visible_treasures > v.length)
        tesoros_visibles = v.length
      else
        tesoros_visibles = @n_visible_treasures
      end
      
      if(@n_hidden_treasures > h.length)
        tesoros_ocultos = h.length
      else
        tesoros_ocultos = @n_hidden_treasures
      end
      
      bad_consequence = NumericBadConsequence.new(@text, @levels, 
          tesoros_visibles, tesoros_ocultos)
        
      bad_consequence
    end
    
    def to_s
      resp = @text
      resp += "\nNiveles que pierdes: #{@levels}" if @levels != 0
      if @n_visible_treasures != 0 || @n_hidden_treasures != 0
          resp += "\nTesoros perdidos: "
          resp += "\n\t -> Visibles = #{@n_visible_treasures}" if @n_visible_treasures != 0
          resp += "\n\t -> Ocultos = #{@n_hidden_treasures}" if @n_hidden_treasures != 0
      end
      resp
    end
    
  end
end

#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
  
require_relative 'treasure_kind.rb'

module NapakalakiGame
  
  class BadConsequence

    @@MAXTREASURES = 10 #Constante del maximo de tesoros permitidos
    attr_reader :text, :levels
    def initialize(a_text, some_levels)
      @text = a_text
      @levels = some_levels
    end
    private_class_method :new
    
    def BadConsequence.MAXTREASURES
      @@MAXTREASURES
    end
    
    def is_empty
      raise NotImplementedError.new
    end

    def substract_visible_treasure(t)
      raise NotImplementedError.new      
    end

    def substract_hidden_treasure(t)
      raise NotImplementedError.new
    end

    def adjust_to_fit_treasure_lists(v, h)
      raise NotImplementedError.new
    end

    #Metodo toString para mostrar los atributos de la clase por pantalla
    def to_s
      raise NotImplementedError.new
    end
    
  end
end
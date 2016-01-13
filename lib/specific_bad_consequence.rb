# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  
  class SpecificBadConsequence < BadConsequence
    
    attr_reader :specific_visible_treasures, :specific_hidden_treasures
    
    def initialize(a_text, some_levels, some_specific_visible_treasures,
        some_specific_hidden_treasures)
      
      super(a_text, some_levels)
      @specific_visible_treasures = some_specific_visible_treasures
      @specific_hidden_treasures = some_specific_hidden_treasures
      
    end
    
    public_class_method :new
    
    def is_empty
      empty = (@specific_visible_treasures.empty? && @specific_hidden_treasures.empty?)
      empty
    end
    
    def substract_hidden_treasure(t)
      if(!(@specific_visible_treasures.empty?)) then
         veces_aparece_tipo_t = 0  #por si el mismo objeto aparece mas de una vez
                                  #ya que delete borra todas sus apariciones en el vector
        @specific_visible_treasures.each do |tipo|
          if(tipo == t.type)
            veces_aparece_tipo_t += 1
          end
        end
        
        @specific_visible_treasures.delete(t.type)
        
        if(veces_aparece_tipo_t > 1) then
          (veces_aparece_tipo_t - 1).times do  
            @specific_visible_treasures << t.type
          end
        end
      end
    end
    
    def substract_hidden_treasure(t)
      if(!(@specific_hidden_treasures.empty?)) then
         veces_aparece_tipo_t = 0  #por si el mismo objeto aparece mas de una vez
                                  #ya que delete borra todas sus apariciones en el vector
        @specific_hidden_treasures.each do |tipo|
          if(tipo == t.type)
            veces_aparece_tipo_t += 1
          end
        end
        
        @specific_hidden_treasures.delete(t.type)
        
        if(veces_aparece_tipo_t > 1) then
          (veces_aparece_tipo_t - 1).times do  
            @specific_hidden_treasures << t.type
          end
        end
      end
    end
    
    def adjust_to_fit_treasure_lists(v, h)
      copia_visibles = Array.new(v)#Hacemos una copia de los tesoros del jugador
      visibles_especificos = Array.new #Creamos el array vacio que vamos a rellenar
      if(!@specific_visible_treasures.empty?)
        @specific_visible_treasures.each do |treasure|
          encontrado = false #Para cortar el bucle si lo encontramos
          i = 0 #Para recorrer el array de copia
          while(!encontrado && (i < copia_visibles.length))
            tesoro_equipado = copia_visibles[i]
            tipo = tesoro_equipado.type
            if(treasure == tipo)
              visibles_especificos << treasure
              copia_visibles.delete_at(i)
              encontrado = true
            end
            i += 1
          end
        end
      end
      
      copia_ocultos = Array.new(h) #Hacemos una copia de los tesoros del jugador
      ocultos_especificos = Array.new #Creamos el array vacio que vamos a rellenar
      if(!@specific_hidden_treasures.empty?)
        @specific_hidden_treasures.each do |treasure|
          encontrado = false #Para cortar el bucle si lo encontramos
          i = 0 #Para recorrer el array de copia
          while(!encontrado && (i < copia_ocultos.length))
            tesoro_oculto = copia_ocultos[i]
            tipo = tesoro_oculto.type
            if(treasure == tipo)
              ocultos_especificos << treasure
              copia_ocultos.delete_at(i)
              encontrado = true
            end
            i += 1
          end
        end
      end
      
      bad_consequence = SpecificBadConsequence.new(@text, @levels,
        visibles_especificos, ocultos_especificos)
      
      bad_consequence
      
    end
    
    def to_s
      resp = @text
      resp += "\nNiveles que pierdes: #{@levels}" if @levels != 0

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
      
      resp
    end

  end
end

#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
  
require_relative 'treasure_kind.rb'

module NapakalakiGame
  
  class BadConsequence

    @@MAXTREASURES = 10 #Constante del maximo de tesoros permitidos

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

    attr_reader :text, :levels, :death
    attr_reader :specific_visible_treasures, :specific_hidden_treasures
    attr_reader :n_visible_treasures, :n_hidden_treasures

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
      new(a_text, Player.MAXLEVEL, @@MAXTREASURES, @@MAXTREASURES, Array.new, Array.new, true)
    end

    def self.MAXTREASURES
      @@MAXTREASURES
    end
    
    def is_empty
      empty = false
      if(@n_visible_treasures == 0 && @n_hidden_treasures == 0 &&
            @specific_visible_treasures.empty? && @specific_hidden_treasures.empty?)
            empty = true
      end
      empty
    end

    def substract_visible_treasure(t)
      if(@n_visible_treasures == 0 && !(@specific_visible_treasures.empty?)) then
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
      
      if(@n_visible_treasures > 0 && @specific_visible_treasures.empty?) then
        @n_visible_treasures -= 1
      end
    end

    def substract_hidden_treasure(t)
      if(@n_hidden_treasures == 0 && !(@specific_hidden_treasures.empty?)) then
        @specific_hidden_treasures.delete(t.type)
      end
      if(@n_hidden_treasures > 0 && @specific_hidden_treasures.empty?) then
        @n_hidden_treasures -= 1
      end
    end

    def adjust_to_fit_treasure_lists(v, h)
      tesoros_visibles = 0
      tesoros_ocultos = 0
      if(@n_visible_treasures > v.length)
        tesoros_visibles = v.length
        puts "Tesoros visibles a eliminar #{tesoros_visibles}"
      else
        tesoros_visibles = @n_visible_treasures
      end
      
      if(@n_hidden_treasures > h.length)
        tesoros_ocultos = h.length
        puts "Tesoros ocultos a eliminar #{tesoros_ocultos}"
      else
        tesoros_ocultos = @n_hidden_treasures
      end
      
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
      
      visibles_especificos.each do |t|
        puts "Objetos visibles a descartar -> #{t}"
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
      
      ocultos_especificos.each do |t|
          puts "Objetos ocultos a descartar -> #{t}"
      end
     
      if(!visibles_especificos.empty? || !ocultos_especificos.empty?)
        bad_consequence = BadConsequence.new_level_specific_treasures(@text, @levels,
        visibles_especificos, ocultos_especificos)
        puts "Creado nuevo bad consequence de especificos"
      end
      
      if(tesoros_visibles > 0 || tesoros_ocultos > 0)
        bad_consequence = BadConsequence.new_level_number_of_treasures(@text, @levels, 
          tesoros_visibles, tesoros_ocultos)
        puts "Creado nuevo bad consequence sin especificos"
      end
      
      if(visibles_especificos.empty? && ocultos_especificos.empty? && 
            tesoros_visibles == 0 && tesoros_ocultos == 0)
          bad_consequence = BadConsequence.new_level_number_of_treasures(
            "No tienes tesoros que descartarte", @levels, tesoros_visibles,
            tesoros_ocultos)
        puts "Creado nuevo bad consequence vacio"
      end
      
      bad_consequence
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

      resp 
    end
  end
end
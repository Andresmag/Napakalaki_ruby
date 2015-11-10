# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require './Treasure'
require './Monster'

class Player
  MAXLEVEL = 10
  def initialize(a_name)
    @name = a_name
    @level = 0
    @dead = true
    @can_I_steal = true
    @enemy = nil
    @visible_treasures = Array.new
    @hidden_treasures = Array.new
    @pending_bad_consequence = nil
  end
  
  attr_reader :name, :dead, :level, :hidden_treasures, :visible_treasures, :can_I_steal
  attr_writer :enemy
  
  
  private
  def bring_to_life
    @dead = false
  end
  
  def get_combat_level
    combat_level = @level
    @visible_treasures.length.times do |num|
      combat_level += @visible_treasures[num].bonus 
    end
    combat_level
  end
  
  def increment_levels(i)
    @level += i
  end
  
  def decrement_levels(i)
    @level -= i
    @level = 1 if (@level <= 0)
  end
  
  def set_pending_bad_consequence(b)
    @pending_bad_consequence = b
  end
  
  def apply_prize(m)
    incremet_levels(m.get_levels_gained())
  end
  
  def apply_bad_consequence(m)
    if(m.bad_consequence.death)
       @dead = true
    else
      decrement_levels(m.bad_consequence.levels)
    end
  end
  
  #def can_make_treasures_visible(t)
    #implementar
  #end
  
  def how_many_visible_treasures(tKind)
    contador = 0
    @visible_treasures.length.times { |num| contador += 1 if (@visible_treasures[num].type == tKind) }
  end
  
  def dielf_no_treasures()
    @dead = true if (@visible_treasures.empty? && @hidden_treasures.empty?)
  end
  
  public
  #def combat(m)
    #por implementar
  #end
  
  def make_treasure_visible(t)
    if(can_make_treasures_visibles(t))
      @visible_treasures[@visible_treasures.length] = t
      @hidden_treasures.delete(t)
    end
  end
  
  def discard_visible_treasure(t)
    @visible_treasures.delete(t)
  end
  
  def discard_hidden_treasures(t)
    @hidden_treasures.delete(t)
  end
  
  def valid_state
    valid = false
    valid = true if (@pending_bad_consequence == nil && @hidden_treasures < 5)
    valid
  end
  
  #def init_treasures
    #por implementar
  #end
  
  #def steal_treasure
    #por implementar
  #end
  
  def discard_all_treasures
    @visible_treasures.clear
    @hidden_treasures.clear
  end
  
  private
  #def give_me_a_treasure
    #por implementar
  #end
  
  def can_you_give_me_a_treasure
    can_steal = false
    if(@enemy.visible_treasures.length > 0 || @enemy.hidden_treasures.length > 0)
      can_steal = true
    end
    can_steal
  end
  
  def have_stolen
    @can_I_steal = false
  end
end

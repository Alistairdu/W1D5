require "byebug"

class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children 
    @children
  end

  def value
    @value
  end

  def parent=(node)  
    # node = a 
    # self = b
    
    if node.nil? 
      #remove self as a children to its parent
      self.parent.children.delete(self)

      #set parent to nil
      @parent = nil  
      return
    end   
    
    unless node.children.include?(self)
      #set a's children to include b 
      self.parent.children.delete(self) if !self.parent.nil?  
      @parent = node
      #add b as a child to a
      node.children << self 
    end
    
  end

  def add_child(node)  
    node.parent = self 
  end 

  def remove_child(node)
    node.parent = nil 
  end

end

def dfs(target_value)
  return self if self == target_value #call dfs on node with target value return node.

  if !self.children.empty? #while children exists 
    self.children[0].dfs(target_value)
  else
    self.parent.children.shift
  end 

  nil
end 


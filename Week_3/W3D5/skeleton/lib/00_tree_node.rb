class PolyTreeNode
    
    def initialize(value)
        @parent = nil 
        @value = value 
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
    
    def parent=(new_parent)
         if @parent != nil 
             self.parent.children.each_with_index do |n, idx| 
                 if n == self 
                     self.parent.children.delete_at(idx)
                     break 
                 end
             end
         end

        @parent = new_parent 
        new_parent.children << self  if parent != nil 
    end

    def inspect 
        [@value, @children]
    end

    #parent.add_child(node)
    def add_child(child) 
        child.parent = self 
        return child if self.children.include?(child) 
        self.children << child 
        child
    end

    def remove_child(child)
        return nil if child == nil
        if !self.children.include?(child)
            raise "invalid child"
            return nil
       end
       child.parent = nil
    end
    
    def dfs(target)
        if self.value == target
            return self
        end 
        self.children.each do |n|
            v = n.dfs(target)
            return v if v != nil
        end
        nil
    end

    def bfs(target)
        queue = []
        return self if self.value == target

        children.each{|n| queue.unshift(n)} 

        until queue.empty?
            n = queue.pop 
            return n if n.value == target
            if !n.children.empty?
              n.children.each {|n| queue.unshift(n)}
            end
        end
        nil
    end

end

# Parent = PolyTreeNode.new(1)
# child = PolyTreeNode.new(2)
# child.parent = Parent
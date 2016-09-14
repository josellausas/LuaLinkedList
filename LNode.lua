---------------------------------------------------------------
-- A doubly linked list Node
--
-- @module Node
-- @author jose@josellausas.com
---------------------------------------------------------------
local Node  = {}
Node.__index = Node

---------------------------------------------------------------
-- Creates a new node containing the data
--
-- @param data **(any)** The data
--
-- @return **(Node)** New Node
---------------------------------------------------------------
function Node.new(data)
  local self = {}
  self.next = nil
  self.prev = nil
  -- Weak table references
  self.ref  = {}
  setmetatable(self.ref, { __mode = 'v' })
  self.ref.data = data

    setmetatable(self, Node)
    return self
end

function Node:setData(data)
	self.ref.data = data
end

---------------------------------------------------------------
-- Returns the next node
--
-- @return **(Node)** The next node (can be nil)
---------------------------------------------------------------
function Node:getNext()
	return self.next
end

---------------------------------------------------------------
-- Returns the previous node. Can be nil
--
-- @return **(Node)** The previous node
---------------------------------------------------------------
function Node:getPrev()
	return self.prev
end

---------------------------------------------------------------
-- Returns the data
--
-- @return **(Node)** The data contained by this node
---------------------------------------------------------------
function Node:getData()
	return self.ref.data
end


return Node

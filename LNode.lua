---------------------------------------------------------------
-- A doubly linked list Node
--
-- @module Node
-- @author jose@josellausas.com
---------------------------------------------------------------
local class = require('middleclass')
local Node  = class('Node')

---------------------------------------------------------------
-- Creates a new node containing the data
--
-- @param data **(any)** The data
---------------------------------------------------------------
function Node:initialize(data)
	self.next = nil
	self.prev = nil
	self.data = data
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
	return data
end


return Node

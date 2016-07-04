---------------------------------------------------------------
-- Linked List tests
--
-- The automated tests.
-- @usage $>busted tests.lua
---------------------------------------------------------------
local Node 		 = nil
local LinkedList = nil

describe('Linked List >', function()
	
	describe('Nodes >', function()
		it('should require Node', function()
			-- Load Node
			Node = require(".LNode")
			assert.truthy(Node)
		end)

		it('should create new nodes', function()
			local n1 = Node:new(nil)
			local n2 = Node:new(1)
			local n3 = Node:new("Dos")

			assert.truthy(n1)
			assert.truthy(n2)
			assert.truthy(n3)

			assert.is_nil(n1.next)
			assert.is_nil(n1.prev)

		end)
	end)
	
	describe('DLL >', function()
		it('should require LinkedList', function()
			LinkedList = require("LinkedList")
			assert.truthy(LinkedList)
		end)
		
		it('should create a new clean instance', function()
			local ll = LinkedList:new()
			assert.truthy(ll)
			assert.is_nil(ll.head)
			assert.is_nil(ll.tail)
			assert.is_equal(ll.count, 0)
			ll = nil
		end)

		it('should push back', function()
			local ll = LinkedList:new()
			ll:pushBack("Hola")
			assert.is_equal(1, ll.count)
			assert.is_truthy(ll.head)
			assert.is_truthy(ll.tail)
		end)

		it('should push front', function()
			local ll = LinkedList:new()
			ll:pushFront("Hola")
			assert.is_equal(1, ll.count)
			assert.is_truthy(ll.head)
			assert.is_truthy(ll.tail)
		end)

		it('should delete all', function()
			local ll = LinkedList:new()
			ll:pushFront("Uno")
			ll:pushFront("Dos")
			ll:pushFront("Tres")
			ll:pushFront("Cuatro")
			ll:pushFront("Cinco")

			assert.is_equal(5, ll.count)

			-- Remove them
			ll:deleteAll()

			assert.is_equal(0, ll.count)
			assert.is_nil(ll.head)
			assert.is_nil(ll.tail)

		end)

		it('should popBack', function()
			local ll = LinkedList:new()
			local label = "Borrado"
			ll:pushBack("Datos")
			ll:pushBack("Datos")
			ll:pushBack("Datos")
			ll:pushBack(label)
			assert.is_equal(ll.tail:getData(), "Borrado")
			assert.is_equal(4, ll.count)
			local nodeToPop = ll:popBack()
			assert.is_equal(nodeToPop, "Borrado")
			assert.is_equal(3, ll.count)
			assert.is_equal(ll.tail:getData(), "Datos")
		end)

		it('should popFront', function()
			local ll = LinkedList:new()
			ll:pushBack("Uno")
			ll:pushBack("dos")
			ll:pushBack("last")
			assert.is_equal(3, ll.count)

			local back = ll:popFront()
			assert.is_equal(back, "Uno")
			assert.is_equal(2, ll.count)

			local otro = ll:popFront()
			assert.is_equal(otro, "dos")
			assert.is_equal(1, ll.count)
			
		end)

		it('shoudld count', function()
			local ll = LinkedList:new()

			assert.is_equal(0, ll.count)

			ll:pushBack("Unod")
			assert.is_equal(1, ll.count)
			
			ll:pushBack("Dos")
			assert.is_equal(2, ll.count)
			
			ll:pushBack("Tres")
			assert.is_equal(3, ll.count)
			
			ll:pushBack("Cuatro")
			assert.is_equal(4, ll.count)
			
			ll:pushBack("Cinco")
			assert.is_equal(5, ll.count)
			
			ll:pushBack("Seis")
			assert.is_equal(6, ll.count)
			
			ll:popBack()
			assert.is_equal(5, ll.count)
			
			ll:popBack()
			assert.is_equal(4, ll.count)

			ll:popBack()
			assert.is_equal(3, ll.count)

			ll:popFront()
			assert.is_equal(2, ll.count)

			ll:popFront()
			assert.is_equal(1, ll.count)

			ll:popFront()
			assert.is_equal(0, ll.count)
		end)

		it('should not remove empty lists', function()
			local ll = LinkedList:new()

			local front = ll:popFront()
			assert.is_nil(front)
			assert.is_equal(0, ll.count)

			local back = ll:popBack()
			assert.is_nil(back)
			assert.is_equal(0, ll.count)

			ll:deleteAll()
		end)

		it('should iterate forward', function()

			local stringArray = {"Hola", " que", " hace", " como", " esta?"}
			local ll = LinkedList:new()

			for i, data in ipairs(stringArray) do
				ll:pushBack(data)
			end

			local node = ll.head
			local outputStringArray = {}
			while(node ~= nil) do
				table.insert(outputStringArray, node:getData())
				node = node.next
			end

			for i,data in ipairs(stringArray) do
				assert.is_equal(data,outputStringArray[i])
			end

			local forwardData = ll:getDataArray()

			assert.is_equal(ll.count, #forwardData)

			for i,v in ipairs(forwardData) do
				assert.is_equal(forwardData[i], stringArray[i])
			end

		end)

		it('should iterate backwards', function()
			local forwardData = {"Hola", " que", " hace", " como", " esta?"}
			local backwardData = {" esta?", " como", " hace", " que", "Hola" }
			local ll = LinkedList:new()

			for i, data in ipairs(forwardData) do
				ll:pushBack(data)
			end

			local backwards = ll:getDataArrayBackwards()

			assert.is_equal(ll.count, #forwardData)

			for i,v in ipairs(backwardData) do
				assert.is_equal(backwardData[i], backwards[i])
			end
		end)

		it('should remove last', function()
			local ll = LinkedList:new()

			ll:pushBack("Uno")
			ll:pushBack("Dos")
			ll:pushBack("Tres")

			ll:removeLast()
			assert.is_equal(2, ll.count)

			ll:removeLast()
			assert.is_equal(1, ll.count)

			ll:removeLast()
			assert.is_equal(0, ll.count)

			ll:removeLast()
			assert.is_equal(0, ll.count)

			ll:removeLast()
			assert.is_equal(0, ll.count)			
		end)

		it('should remove first', function()

			local ll = LinkedList:new()

			ll:pushBack("Uno")
			ll:pushBack("Dos")

			ll:removeFirst()

			assert.is_equal(ll.count, 1)
			assert.is_equal(ll.head:getData(), "Dos")

		end)

		pending('should remove item at index', function()

		end)

		pending('should remove item', function()

		end)
	end)
end)
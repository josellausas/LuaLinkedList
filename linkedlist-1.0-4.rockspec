package = "LinkedList"
version = "1.0-4"
source = {
	url = "https://github.com/zunware/LuaLinkedList",
	tag = "1.0-4"
}
description = {
	summary = "A Doubly-Linked List implementation",
	detailed = [[
		A doubly linked list for Lua.
	]],
	homepage = "http://josellausas.com",
	license = "Apache 2.0"
}
dependencies = {
	"lua ~> 5.2"
}
build = {
	type = "builtin",
	modules = {
		LinkedList = "LinkedList.lua",
		LNode = "LNode.lua"
	}
}



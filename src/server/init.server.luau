local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

const components = require("@shared/ecs/components")
const blink = require("@server/blink")
const replicator = require("@server/ecs/replicator")
const startup = require("@shared/ecs/startup")

local systems = {}

const function add_systems(folder: Folder)
	for _, system in folder:QueryDescendants("ModuleScript") do
		table.insert(systems, require(system))
	end
end

add_systems(ServerScriptService.server.ecs.systems)
add_systems(ReplicatedStorage.shared.ecs.systems)
startup(systems)

replicator:init()
blink.receive_full.on(function(player): (buffer?, { any }?)
	print("receive full received")
	replicator:mark_player_ready(player)
	return replicator:get_full(player)
end)

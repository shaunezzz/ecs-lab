local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

const components = require("@game/ReplicatedStorage/shared/ecs/components")
const replicator = require("@self/ecs/replicator")
const startup = require("@game/ReplicatedStorage/shared/ecs/startup")
const world = require("@game/ReplicatedStorage/shared/ecs/world")

local systems = {}

const function add_systems(folder: Folder)
	for _, system in folder:QueryDescendants("ModuleScript") do
		table.insert(systems, require(system))
	end
end

add_systems(ServerScriptService.server.ecs.systems)
add_systems(ReplicatedStorage.shared.ecs.systems)
startup(systems)

replicator:init(world)

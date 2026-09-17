local ReplicatedStorage = game:GetService("ReplicatedStorage")

const components = require("@shared/ecs/components")
const replicator = require("@client/ecs/replicator")
const startup = require("@shared/ecs/startup")
const world = require("@shared/ecs/world")

local systems = {}

const function add_systems(folder: Folder)
	for _, system in folder:QueryDescendants("ModuleScript") do
		table.insert(systems, require(system))
	end
end

add_systems(ReplicatedStorage.client.ecs.hooks)
add_systems(ReplicatedStorage.client.ecs.systems)
add_systems(ReplicatedStorage.shared.ecs.systems)
startup(systems)

replicator:init(world)

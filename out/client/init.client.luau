local ReplicatedStorage = game:GetService("ReplicatedStorage")

const components = require("@game/ReplicatedStorage/shared/ecs/components")
const blink = require("@self/blink")
const replicator = require("@self/ecs/replicator")
const startup = require("@game/ReplicatedStorage/shared/ecs/startup")

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

replicator:init()
blink.receive_full.invoke():andThen(function(buf, variants)
	print("receive full invoked")
	replicator:apply_full(buf, variants)
end)

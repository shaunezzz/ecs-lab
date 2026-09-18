const Players = game:GetService("Players")

const jecs = require("@game/ReplicatedStorage/packages/jecs")
const jecs_utils = require("@game/ReplicatedStorage/packages/jecs_utils")
const replicator = require("../../replicator")
const components = require("@game/ReplicatedStorage/shared/ecs/components")
const player_prefab = require("@game/ReplicatedStorage/shared/ecs/prefabs/player_prefab")

const Player = components.player

const function create_player(world: jecs.World)
	local player_added = jecs_utils.collect(Players.PlayerAdded)

	return function()
		for player in player_added do
			local player_id = player_prefab(player)

			world:set(player_id, components.server_position, 0)

			replicator:set_networked(player_id)
			replicator:set_reliable(player_id, Player)
			replicator:set_reliable(player_id, components.server_position)
			replicator:set_custom(player_id, Player)

			print("New player entity:", player_id)
		end
	end
end

return create_player

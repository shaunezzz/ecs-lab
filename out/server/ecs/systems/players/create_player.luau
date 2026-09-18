const Players = game:GetService("Players")

const jecs = require("@game/ReplicatedStorage/packages/jecs")
const jecs_utils = require("@game/ReplicatedStorage/packages/jecs_utils")
const replicator = require("../../replicator")
const components = require("@game/ReplicatedStorage/shared/ecs/components")
const phases = require("@game/ReplicatedStorage/shared/ecs/phases")
const player_prefab = require("@game/ReplicatedStorage/shared/ecs/prefabs/player_prefab")

const Name = components.name
const Player = components.player
const Position = components.position

const function create_player(world: jecs.World)
	local player_added = jecs_utils.collect(Players.PlayerAdded)

	return function()
		for _, player in player_added do
			local player_id = player_prefab(player)

			replicator:set_networked(player_id)
			replicator:set_reliable(player_id, Name)
			replicator:set_reliable(player_id, Player)
			replicator:set_reliable(player_id, Position, {
				[player] = false,
			})
			replicator:set_custom(player_id, Player)

			print("New player entity:", player_id)
		end
	end
end

return {
	system = create_player,
	phase = phases.First,
}

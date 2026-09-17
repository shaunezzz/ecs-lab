const jecs = require("@game/ReplicatedStorage/packages/jecs")
const replicator = require("../../replicator")
const spawn_points = require("@game/ReplicatedStorage/shared/constants/spawn_points")
const components = require("@game/ReplicatedStorage/shared/ecs/components")

const Player = components.player
const ServerPosition = components.server_position

const function create_server_root(world: jecs.World)
	const query = world:query(Player):without(ServerPosition):cached()

	return function()
		for player_id, player in query do
			world:set(player_id, ServerPosition, spawn_points.default)
			replicator:set_reliable(player_id, ServerPosition)

			print("Server position has been setup", world:get(player_id, ServerPosition))
		end
	end
end

return create_server_root

const jecs = require("@pkg/jecs")
const replicator = require("@server/ecs/replicator")
const spawn_points = require("@shared/constants/spawn_points")
const components = require("@shared/ecs/components")

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

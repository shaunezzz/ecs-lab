const jecs = require("@pkg/jecs")
const components = require("@shared/ecs/components")

const Player = components.player
const ClientPosition = components.client_position
const ServerPosition = components.server_position

const function create_client_root(world: jecs.World)
	const query = world:query(Player, ServerPosition):without(ClientPosition):cached()

	return function()
		for player_id, player, server_position in query do
			print("Setting up client position")
			world:set(player_id, ClientPosition, server_position)
		end
	end
end

return create_client_root

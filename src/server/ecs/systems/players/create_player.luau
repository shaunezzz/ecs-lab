const Players = game:GetService("Players")

const jecs = require("@pkg/jecs")
const jecs_utils = require("@pkg/jecs_utils")
const replicator = require("@server/ecs/replicator")
const components = require("@shared/ecs/components")

local player_added = jecs_utils.collect(Players.PlayerAdded)

const Name = components.name
const Player = components.player

const function create_player(world: jecs.World)
	for player in player_added do
		local player_id = world:entity()
		world:set(player_id, Name, tostring(player))
		world:set(player_id, Player, player)

		replicator:set_networked(player_id)
		replicator:set_reliable(player_id, Player)
		replicator:set_custom(player_id, Player)

		print("New player entity:", player_id)
	end
end

return create_player

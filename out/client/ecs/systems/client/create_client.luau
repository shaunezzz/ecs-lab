const Players = game:GetService("Players")

const jecs = require("@game/ReplicatedStorage/packages/jecs")
const jecs_utils = require("@game/ReplicatedStorage/packages/jecs_utils")
const components = require("@game/ReplicatedStorage/shared/ecs/components")
const phases = require("@game/ReplicatedStorage/shared/ecs/phases")

const local_player = Players.LocalPlayer

const CustomHandler = components.custom_handler
const Client = components.client
const Player = components.player

const function create_client(world: jecs.World)
	jecs_utils.ref(local_player, function(client_id: jecs.Entity)
		world:add(client_id, Client)
		world:set(client_id, Player, local_player)

		world:set(Player, CustomHandler, function(player: Player)
			return jecs_utils.ref[player]
		end)
	end)
end

return {
	system = create_client,
	phase = phases.Startup,
}

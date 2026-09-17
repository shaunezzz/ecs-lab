const components = require("@shared/ecs/components")
const world = require("@shared/ecs/world")

const Name = components.name
const Player = components.player

const function player_prefab(player: Player)
	local player_id = world:entity()
	world:set(player_id, Name, tostring(player))
	world:set(player_id, Player, player)
	return player_id
end

return player_prefab

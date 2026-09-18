const jecs = require("@pkg/jecs")
const replicator = require("@server/ecs/replicator")
const spawn_points = require("@shared/constants/spawn_points")
const components = require("@shared/ecs/components")

const Player = components.player
const Position = components.position

const function spawn_player(world: jecs.World)
	const query = world:query():with(Player):without(Position):cached()

	return function()
		for player_id in query do
			world:set(
				player_id,
				Position,
				spawn_points.default.Position --Vector3.new(math.random(5, 10), math.random(5, 10), math.random(5, 10)
			)

			replicator:set_once(player_id, Position)
		end
	end
end

return spawn_player

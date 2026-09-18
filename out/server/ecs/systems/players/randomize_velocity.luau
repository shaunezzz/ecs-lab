const jecs = require("@game/ReplicatedStorage/packages/jecs")
const components = require("@game/ReplicatedStorage/shared/ecs/components")

const Position = components.position
const Velocity = components.velocity

const function randomize_velocity(world: jecs.World)
	const query = world:query(Position, Velocity):cached()

	return function()
		for entity_id, position, velocity in query do
			world:set(entity_id, Velocity, Vector3.new(math.random(-1, 1), 0, math.random(-1, 1)))
			world:set(entity_id, Position, position + world:get(entity_id, Velocity))
		end
	end
end

return randomize_velocity

const jecs = require("@pkg/jecs")
const components = require("@shared/ecs/components")

const Model = components.model
const Position = components.position

const function update_positions(world: jecs.World)
	const query = world:query(Model, Position):cached()

	return function()
		for entity_id, model, position in query do
			model.Position = position
		end
	end
end

return update_positions

const jecs = require("@pkg/jecs")
const components = require("@shared/ecs/components")
const phases = require("@shared/ecs/phases")

const Destroy = components.destroy

const function destroy_entities(world: jecs.World)
	for entity_id in world:each(Destroy) do
		world:delete(entity_id)
	end
end

return {
	system = destroy_entities,
	phase = phases.Last,
}

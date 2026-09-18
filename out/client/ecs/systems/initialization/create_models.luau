const new_root_model = require("../../../functions/new_root_model")
const jecs = require("@game/ReplicatedStorage/packages/jecs")
const components = require("@game/ReplicatedStorage/shared/ecs/components")
const phases = require("@game/ReplicatedStorage/shared/ecs/phases")

const Client = components.client
const Model = components.model
const Position = components.position

const function create_models(world: jecs.World)
	const query = world:query(Position):without(Model):cached()

	return function()
		for entity_id, position in query do
			local root_model = new_root_model(position)

			world:set(entity_id, Model, root_model)

			if world:has(entity_id, Client) then
				workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
				workspace.CurrentCamera.CameraSubject = root_model
			end
		end
	end
end

return {
	system = create_models,
	phase = phases.Update,
}

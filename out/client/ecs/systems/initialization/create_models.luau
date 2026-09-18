const jecs = require("@game/ReplicatedStorage/packages/jecs")
const root_models = require("@game/ReplicatedStorage/shared/constants/root_models")
const components = require("@game/ReplicatedStorage/shared/ecs/components")
const phases = require("@game/ReplicatedStorage/shared/ecs/phases")

const Client = components.client
const Model = components.model
const Position = components.position

const CLIENT_COLOR = Color3.new(0.145098, 0.313725, 0.988235)
const PLAYER_COLOR = Color3.new(1, 0.129412, 0.129412)

const function create_models(world: jecs.World)
	const query = world:query(Position):without(Model):cached()

	return function()
		for entity_id, position in query do
			local is_client = world:has(entity_id, Client)

			local root_model = root_models.default:Clone()
			root_model.Position = position
			root_model.Color = is_client and CLIENT_COLOR or PLAYER_COLOR
			root_model.Parent = workspace

			world:set(entity_id, Model, root_model)

			if is_client then
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

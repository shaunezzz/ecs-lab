const root_models = require("@shared/constants/root_models")

const function new_root_model(position: Vector3)
	local root_model = root_models.default:Clone()
	root_model.Position = position
	root_model.Parent = workspace
	return root_model
end

return new_root_model

local RunService = game:GetService("RunService")

local vide = require("../../../packages/roblox/vide")
local loop = require("../../modules/loop")
local widget = require("@self/widget")

local cleanup = vide.cleanup

local home = {
	class_name = "app" :: "app",
	name = "Home"
}

function home.mount(_: nil, destroy: () -> ())

	local servers = vide.source {} :: any
	local app_loop = loop (
		"app-client-home",
		servers,

		{i = 1},
		script.systems.get_core_data
	)

	cleanup(
		RunService.Heartbeat:Connect(app_loop)
	)

	return widget {
		servers = servers,
		destroy = destroy
	}

end

return home
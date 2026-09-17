local ContextActionService = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")

const jabby = require("@pkg/jabby")
const planck = require("@pkg/planck")
const planck_jabby = require("@pkg/planck_jabby")
const planck_rs = require("@pkg/planck_rs")
const world = require("@shared/ecs/world")

local scheduler = planck.Scheduler.new(world):addPlugin(planck_jabby.new()):addPlugin(planck_rs.Plugin.new())

return function(systems)
	if #systems ~= 0 then
		scheduler:addSystems(systems)
	end

	if RunService:IsClient() then
		local client = jabby.obtain_client()

		local function create_widget(_, state: Enum.UserInputState)
			if state ~= Enum.UserInputState.Begin then
				return
			end

			client.spawn_app(client.apps.home, nil)
		end

		ContextActionService:BindAction("Open Jabby", create_widget, false, Enum.KeyCode.F4)
	end

	jabby.register({
		applet = jabby.applets.world,
		name = "Jecs World",
		configuration = {
			world = world,
		},
	})
end

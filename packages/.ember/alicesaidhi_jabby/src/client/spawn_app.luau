local Players = game:GetService("Players")

local vide = require("../../packages/roblox/vide")
local types = require("../modules/types")

local destroy_fn = {}

local function unmount_all()
	for _, destroy in destroy_fn do
		destroy()
	end
end

local function spawn_app<T>(app: types.Application<T>, props: T): () -> ()
	return vide.root(function(destroy)
        
		local cleanup = function()
			destroy_fn[destroy] = nil
			destroy()
		end

		local application = app.mount(props, cleanup)
		application.Parent = Players.LocalPlayer.PlayerGui

		vide.cleanup(application)

		destroy_fn[destroy] = cleanup

		return cleanup
	end)
end

return {
	unmount_all = unmount_all,
	spawn_app = spawn_app
}
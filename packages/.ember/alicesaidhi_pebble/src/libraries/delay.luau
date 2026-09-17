local RunService = game:GetService("RunService")

local vide = require("../../packages/roblox/vide")

local source = vide.source
local effect = vide.effect
local cleanup = vide.cleanup

return function<T>(delay: number, input: () -> T): () -> T
	local output = source(input())

	effect(function()
			local v = input()
			local t = delay

			cleanup(RunService.Heartbeat:Connect(function(dt)
				t -= dt
				if t > 0 then return end
				output(v)
			
			end))

	end)

	return output
end
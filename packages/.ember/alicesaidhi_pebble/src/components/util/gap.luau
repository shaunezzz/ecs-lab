local vide = require("../../../packages/roblox/vide")
local container = require("./container")

local read = vide.read

type can<T> = T | () -> T
type props = {

	gap: can<number>,
	direction: can<"x" | "y">?,

}

return function(props: props)

	local function direction()
		return read(props.direction) or "x"
	end

	return container {

		Size = function()
			return if direction() == "x" then
				UDim2.new(0, read(props.gap), 1, 0)
			else
				UDim2.new(1, 0, 0, read(props.gap))
		end

	}

end
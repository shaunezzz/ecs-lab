local vide = require("../../../packages/roblox/vide")

local create = vide.create

type can<T> = T | () -> T
type props = {
	zindex: can<number>?,
	transparency: can<number>?
}

return function(props: props)
	
	return create "UIStroke" {

		Thickness = 2,
		Color = Color3.new(0, 0, 0),
		Transparency = 0.8

	}
end
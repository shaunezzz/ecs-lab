local pebble = require("../../../../packages/roblox/pebble")
local vide = require("../../../../packages/roblox/vide")
local types = require("../../../modules/types")
local watch_tracker = require("./watch_tracker")

type props = {
	host: "server" | Player,
	vm: number,

	scheduler: number,
	system: number,
	name: string,

	destroy: () -> (),

	recording: vide.Source<boolean>,
	watching_frame: vide.Source<number>,
	per_frame_data: () -> {[number]: number},
	changes: () -> types.WatchLoggedChanges,
}

return function(props: props)

	return pebble.widget {
		title = `system - {props.name}`,
		subtitle = `host: {props.host} vm: {props.vm} scheduler: {props.scheduler} system: {props.system}`,
		bind_to_close = props.destroy,
		size = Vector2.new(350, 400),
		min_size = Vector2.new(300, 300),

		watch_tracker(props)
	}

end
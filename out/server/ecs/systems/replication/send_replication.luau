const jecs = require("@game/ReplicatedStorage/packages/jecs")
const jecs_utils = require("@game/ReplicatedStorage/packages/jecs_utils")
const blink = require("../../../blink")
const replicator = require("../../replicator")
const phases = require("@game/ReplicatedStorage/shared/ecs/phases")

const function send_replication(world: jecs.World)
	const reliable_interval = jecs_utils.interval(1 / 20)
	const unreliable_interval = jecs_utils.interval(1 / 30)

	return function()
		if reliable_interval() then
			for _, player in blink.request_full.iter() do
				replicator:mark_player_ready(player)
				const buf, variants = replicator:get_full(player)
				blink.send_full.fire(player, buf, variants)
				print("Sent initial full")
			end

			for player, buf, variants in replicator:collect_updates() do
				blink.send_reliables.fire(player, buf, variants)
				print("Sent reliable updates")
			end
		end

		if unreliable_interval() then
			for player, buf, variants in replicator:collect_unreliable() do
				blink.send_unreliables.fire(player, buf, variants)
				print("Sent unreliables")
			end
		end
	end
end

return {
	system = send_replication,
	phase = phases.Last,
}

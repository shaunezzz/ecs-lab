const jecs = require("@pkg/jecs")
const jecs_utils = require("@pkg/jecs_utils")
const blink = require("@server/blink")
const replicator = require("@server/ecs/replicator")

const reliable_interval = jecs_utils.interval(1 / 20)
const unreliable_interval = jecs_utils.interval(1 / 30)

const function send_replication(world: jecs.World)
	if reliable_interval() then
		for player, buf, variants in replicator:collect_updates() do
			blink.send_reliables.fire(player, buf, variants)
			print("Sent updates")
		end
	end

	if unreliable_interval() then
		for player, buf, variants in replicator:collect_unreliable() do
			blink.send_unreliables.fire(player, buf, variants)
			print("Sent unreliables")
		end
	end
end

return send_replication

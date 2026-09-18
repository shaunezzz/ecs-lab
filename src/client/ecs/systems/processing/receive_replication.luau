const blink = require("@client/blink")
const replicator = require("@client/ecs/replicator")
const jecs = require("@pkg/jecs")
const phases = require("@shared/ecs/phases")

const function receive_replication(world: jecs.World)
	blink.request_full.fire()

	return function()
		for _, buf, variants in blink.send_full.iter() do
			replicator:apply_full(buf, variants)
			print("Received initial full")
		end

		for _, buf, variants in blink.send_reliables.iter() do
			replicator:apply_updates(buf, variants)
		end

		for _, buf, variants in blink.send_unreliables.iter() do
			replicator:apply_unreliable(buf, variants)
		end
	end
end

return {
	system = receive_replication,
	phase = phases.First,
}

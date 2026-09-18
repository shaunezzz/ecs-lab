const blink = require("../../../blink")
const replicator = require("../../replicator")
const jecs = require("@game/ReplicatedStorage/packages/jecs")
const phases = require("@game/ReplicatedStorage/shared/ecs/phases")

const function receive_replication(world: jecs.World)
	blink.request_full.fire()

	return function()
		for _, buf, variants in blink.send_full.iter() do
			replicator:apply_full(buf, variants)
			print("Received initial full")
		end

		for _, buf, variants in blink.send_reliables.iter() do
			replicator:apply_updates(buf, variants)
			print("Reliable update received")
		end

		for _, buf, variants in blink.send_unreliables.iter() do
			replicator:apply_unreliable(buf, variants)
			print("Unreliable update received")
		end
	end
end

return {
	system = receive_replication,
	phase = phases.First,
}

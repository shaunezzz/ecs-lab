const blink = require("@client/blink")
const replicator = require("@client/ecs/replicator")
const jecs = require("@pkg/jecs")

const function receive_replication(world: jecs.World)
	for _, buf, variants in blink.send_reliables.iter() do
		replicator:apply_updates(buf, variants)
		print("Update received")
	end

	for _, buf, variants in blink.send_unreliables.iter() do
		replicator:apply_unreliable(buf, variants)
		print("Unreliable update received")
	end
end

return receive_replication

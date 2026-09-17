const jecs = require("@game/ReplicatedStorage/packages/jecs")
const components = require("@game/ReplicatedStorage/shared/ecs/components")
const phases = require("@game/ReplicatedStorage/shared/ecs/phases")

const Player = components.player

const function added_player(world: jecs.World)
	world:added(
		Player,
		function(entity_id: jecs.Entity, id: jecs.Id, value: any)
			print(entity_id, "had component:", id, "added")
		end
	)
end

return {
	system = added_player,
	phase = phases.Startup,
}

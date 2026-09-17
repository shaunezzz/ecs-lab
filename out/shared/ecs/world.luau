const jecs = require("@game/ReplicatedStorage/packages/jecs")
const jecs_utils = require("@game/ReplicatedStorage/packages/jecs_utils")
const replecs = require("@game/ReplicatedStorage/packages/replecs")

local world = jecs.world()
jecs_utils.world(world)

return world

const jecs = require("@pkg/jecs")
const jecs_utils = require("@pkg/jecs_utils")
const replecs = require("@pkg/replecs")

local world = jecs.world()
jecs_utils.world(world)

return world

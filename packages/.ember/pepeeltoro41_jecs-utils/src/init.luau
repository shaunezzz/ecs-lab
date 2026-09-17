local jecs = require("./packages/roblox/jecs")

local query_first = require("@self/query-first")
local query_count = require("@self/query-count")
local query_entities = require("@self/query-entities")
local query_changed = require("@self/query-changed")
local query_random = require("@self/query-random")
local query_monitor = require("@self/query-monitor")

local collect = require("@self/collect")
local interval = require("@self/interval")
local ref = require("@self/ref")
local observers = require("@self/observers")
local is_a = require("@self/is-a")

local utils = {
	query_first = query_first,
	query_count = query_count,
	query_entities = query_entities,
	query_random = query_random,
	query_changed = query_changed,
	query_monitor = query_monitor,

	collect = collect,
	interval = interval,
	ref = ref,
	is_a = is_a.is_a,
	IsA = is_a.is_a,

	observer = observers.observer,
	monitor = observers.monitor,

	__world = nil :: jecs.World?,
}
utils.default = utils

function utils.world(world: jecs.World)
	utils.__world = world

	ref.world(world)
	is_a.world(world)

	utils.is_a = is_a.is_a
	utils.IsA = is_a.is_a
end

return utils

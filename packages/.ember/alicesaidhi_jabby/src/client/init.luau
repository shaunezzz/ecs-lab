local entity = require("@self/apps/entity")
local home = require("@self/apps/home")
local overview_scheduler = require("@self/apps/overview_scheduler")
local registry = require("@self/apps/registry")
local spawn_app = require("@self/spawn_app")

return {

	apps = {
		home = home,
		entity = entity,
		scheduler = overview_scheduler,
		registry = registry,
	},

	spawn_app = spawn_app.spawn_app,
	unmount_all = spawn_app.unmount_all

}
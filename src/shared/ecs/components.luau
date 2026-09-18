const jecs = require("@pkg/jecs")
const replecs = require("@pkg/replecs")

const function component<T>(name: string)
	const id = jecs.component<<T>>()
	jecs.meta(id, jecs.Name, name)
	jecs.meta(id, replecs.shared)
	return id
end

const function tag(name: string)
	const id = jecs.tag()
	jecs.meta(id, jecs.Name, name)
	jecs.meta(id, replecs.shared)
	return id
end

return table.freeze({
	networked = replecs.networked,
	reliable = replecs.reliable,
	unreliable = replecs.unreliable,
	relation = replecs.relation,
	custom_handler = replecs.custom_handler,

	name = component<<string>>("Name"),
	player = component<<Player>>("Player"),
	client = tag("Client"),

	model = component<<Model>>("Model"),
	position = component<<Vector3>>("Position"),
	velocity = component<<Vector3>>("Velocity"),

	lifetime = component<<number>>("Lifetime"),
	destroy = tag("Destroy"),
})

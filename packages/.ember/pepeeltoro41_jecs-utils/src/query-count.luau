local jecs = require("../packages/roblox/jecs")

--- Fast way to count the number of entities that match the query.
--- @param query: the query to count entities from
--- @return count: the number of entities
function query_count(query: jecs.Query<...any>): number
	local count = 0
	for _, archetype in query:archetypes() do
		count = count + #archetype.entities
	end
	return count
end

return query_count

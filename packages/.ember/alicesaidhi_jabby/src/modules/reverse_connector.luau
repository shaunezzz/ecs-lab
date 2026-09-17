--!nocheck
local types = require("./types")

local function reverse(connector: types.IncomingConnector): types.OutgoingConnector
	return {
		host = connector.host,
		to_vm = connector.from_vm,
	}
end

return reverse
local Players = game:GetService("Players")

local net = require("../../modules/net")
local queue = require("../../modules/queue")
local remotes = require("../../modules/remotes")
local reverse_connector = require("../../modules/reverse_connector")
local traffic_check = require("../../modules/traffic_check")


return function()

	local ping = queue(remotes.ping)

	for _, player in Players:GetPlayers() do
		if traffic_check.communication_is_allowed(net.local_host, player, true) then
			remotes.new_server_registered:fire({
				host = player,
			})
		end
	end

	return function()
		for connector in ping:iter() do
			local outgoing = reverse_connector(connector)
			remotes.new_server_registered:fire(outgoing)
		end
	end
end
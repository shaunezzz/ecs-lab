const planck = require("@game/ReplicatedStorage/packages/planck")
const planck_rs = require("@game/ReplicatedStorage/packages/planck_rs")

type Phases = typeof(planck.Phase) & typeof(planck_rs.Phases)

local phases: Phases = {} :: Phases

for name, phase in planck.Phase do
	(phases :: any)[name] = phase
end

for name, phase in planck_rs.Phases do
	(phases :: any)[name] = phase
end

return table.freeze(phases) :: Phases

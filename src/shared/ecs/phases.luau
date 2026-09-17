const planck = require("@pkg/planck")
const planck_rs = require("@pkg/planck_rs")

type Phases = typeof(planck.Phase) & typeof(planck_rs.Phases)

local phases: Phases = {} :: Phases

for name, phase in planck.Phase do
	(phases :: any)[name] = phase
end

for name, phase in planck_rs.Phases do
	(phases :: any)[name] = phase
end

return table.freeze(phases) :: Phases

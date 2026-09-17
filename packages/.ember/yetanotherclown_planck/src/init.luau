local Phase = require("@self/Phase")
local Pipeline = require("@self/Pipeline")
local Scheduler = require("@self/Scheduler")

local conditions = require("@self/conditions")

export type Phase = Phase.Phase
export type Pipeline = Pipeline.Pipeline
export type Scheduler<U...> = Scheduler.Scheduler<U...>

export type System<U...> = Scheduler.System<U...>
export type SystemFn<U...> = Scheduler.SystemFn<U...>
export type SystemTable<U...> = Scheduler.SystemTable<U...>
export type InitializerSystemFn<U...> = Scheduler.InitializerSystemFn<U...>
export type InitializerResult<U...> = Scheduler.InitializerResult<U...>
export type CleanupFn<U...> = SystemFn<U...>

export type SystemInfo<U...> = Scheduler.SystemInfo<U...>

export type SystemHookContext = Scheduler.SystemHookContext
export type SystemReplaceContext = Scheduler.SystemReplaceContext
export type SystemEditedContext = Scheduler.SystemEditedContext
export type SystemErrorContext = Scheduler.SystemErrorContext
export type SystemCallContext = Scheduler.SystemCallContext
export type PhaseContext = Scheduler.PhaseContext

return {
	Phase = Phase,
	Pipeline = Pipeline,
	Scheduler = Scheduler,

	isNot = conditions.isNot,
	runOnce = conditions.runOnce,
	timePassed = conditions.timePassed,
	onEvent = conditions.onEvent,
}

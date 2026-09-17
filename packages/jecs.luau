local module = require("./.ember/ukendio_jecs/src/jecs")
export type Archetype = module.Archetype
export type QueryInner = module.QueryInner
export type Entity<T = nil> = module.Entity<T>
export type Id<T = any> = module.Id<T>
export type Pair<First = any, Second = any> = module.Pair<First, Second>
export type Component<T = any> = module.Component<T>
export type Id2<First, Second = nil> = module.Id2<First, Second>
export type Item<T...> = module.Item<T...>
export type Iter<T...> = module.Iter<T...>
export type Cached_Query_Iter<T...> = module.Cached_Query_Iter<T...>
export type Cached_Query<T...> = module.Cached_Query<T...>
export type Query<T...> = module.Query<T...>
export type Observer = module.Observer
export type observer = module.observer
export type World = module.World
export type Record = module.Record
export type ComponentRecord = module.ComponentRecord
export type ComponentIndex = module.ComponentIndex
export type Archetypes = module.Archetypes
export type EntityIndex = module.EntityIndex
return module

local module = require("../../../howmanysmall_typed-promise/src")
export type Status = module.Status
export type ErrorKind = module.ErrorKind
export type Error = module.Error
export type Promise = module.Promise
export type TypedPromise<T...> = module.TypedPromise<T...>
export type PromiseStatic = module.PromiseStatic
return module

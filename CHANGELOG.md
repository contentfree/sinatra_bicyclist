# Change Log
All notable changes to this project will be documented in this file.

## 0.2.0 - 2014-10-07
### Added
- added `Sinatra::Bicyclist::Cycle` that handles cycling the session

### Changed
- moved methods that require session from `Sinatra::Bicyclist::Cycler` to `Sinatra::Bicyclist::Cycle`

## 0.1.0 - 2014-09-30
### Added
- support for more cycle groups
  now you can specify `routes_to_cycle_through` as a hash
  then it picks one of the keys and starts cycling all values of given key
- a "Change Log"

### Changed
- Changed project name to sinatra_bicyclist

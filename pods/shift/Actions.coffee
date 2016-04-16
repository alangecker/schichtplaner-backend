liquidFlux = require 'liquidFlux/backend'
constants = require './constants'
moment = require 'moment'


module.exports = liquidFlux.createActions
  add: (req) ->
    payload =
      ScheduleId: req.body.scheduleId
      start: moment(req.body.start).format()
      end: moment(req.body.end).format()

    @dispatch(constants.ADD, payload)

  update: (req) ->
    payload =
      id: req.params.shiftId

    payload.start = moment(req.body.start).format() if req.body.start
    payload.end = moment(req.body.end).format() if req.body.end
    payload.groups = req.body.groups if req.body.groups
    @dispatch(constants.UPDATE, payload)

  delete: (req) ->
    @dispatch(constants.DELETE, parseInt(req.params.shiftId))

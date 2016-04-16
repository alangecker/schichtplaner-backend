liquidFlux = require 'liquidFlux/backend'
models = require '../../models'
constants = require './constants'

module.exports = liquidFlux.createStore
  pod: 'User'
  initialise: ->
    @bindAction constants.CREATE, @doCreate
    # @bindAction constants.UPDATE, @doUpdateShift
    # @bindAction constants.DELETE, @doDeleteShift
    #

  get:
    groups:  -> models.Group.findAll()
    users:  -> models.User.findAll()
    userByMail: (mail) -> models.User.findOne(where:{email:mail})
    userByPhone: (number) -> models.User.findOne(where:{mobile:number})
    userWithEvent: (userId, eventId) ->
      models.User.findOne({
        where: {id: userId}
        include: [
          models.Group
          {
            model: models.Shift
            include: [
              {
                model: models.Schedule
                where: {EventId:eventId}
              }
            ]
          },
          {
            model: models.UserEventSettings
            where: {EventId:eventId}
            include: [
              {model: models.Schedule, as: 'MainPosition'},
              {model: models.User, as: 'FavoritePartner'},
              # TODO: add favorite Positions/Schedules
            ]
          }
        ]
      })

  do:
    create: (payload) ->
      console.log 'create'
      models.User.create(payload).then (el) =>
        console.log 'done'
        @emitChange()
      # console.log payload

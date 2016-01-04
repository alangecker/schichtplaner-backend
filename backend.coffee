liquidFlux = require 'liquidFlux/backend'
models = require './models'
config = require './config'

liquidFlux.Router.add(require './pods/schedule/routes')
liquidFlux.Router.add(require './pods/shift/routes')
liquidFlux.Router.add(require './pods/user/routes')
liquidFlux.Router.add(require './pods/notifications/routes')


models.sequelize.sync().then ->
  liquidFlux.Redis.connect(config.redis)



  # moment = require 'moment'
  # offset = 31449600
  # for id,user of users
  #   models.User.create(
  #     id: user.id
  #     name: user.name
  #   ).then((el) ->
  #     for groupId in user.groups
  #       el.addGroup GroupId: groupId
  #   )
  #   models.UserEventSettings.create(
  #     EventId: 1
  #     UserId: user.id
  #     from: moment.unix(user.from+offset).format()
  #     until: moment.unix(user.until+offset).format()
  #     setupScore: user.setupRating
  #     MainScheduleId: user.main
  #   ).then((el) ->
  #     for partnerId in user.partner
  #       models.FavoritePartner.create
  #         UserEventSettingId: el.id
  #         UserId: partnerId
  #   )
  #
  #
  # for shift in shifts
  #   shift.start = moment.unix(shift.start+offset).format()
  #   shift.end = moment.unix(shift.end+offset).format()
  #   shift.ScheduleId = parseInt(shift.scheduleId)
  #
  #   models.Shift.create(shift)

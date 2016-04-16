liquidFlux = require 'liquidFlux/backend'
constants = require './constants'
moment = require 'moment'

module.exports = liquidFlux.createActions

  register: (req) ->
    console.log req.body
    payload =
      name: req.body.name
      firstname: req.body.firstname
      surname: req.body.surname
      birthday: moment(req.body.birthday).format()
      RefererId: parseInt(req.body.refererId)
      email: req.body.email
      password: req.body.password
      mobile: req.body.mobile

      event:
        
        from: moment(req.body.present.start).format()
        until: moment(req.body.present.end).format()
        FavoritePartners: req.body.favoritePartners
        favoritePositions: req.body.favoritePositions
        maxLoad: 100




    @dispatch(constants.CREATE, payload)

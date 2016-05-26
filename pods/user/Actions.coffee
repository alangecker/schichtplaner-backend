liquidFlux = require 'liquidFlux/backend'
constants = require './constants'
moment = require 'moment'
scrypt = require 'scrypt'


module.exports = liquidFlux.createActions

  register: (req) ->
    console.log req.body
    scrypt.hash req.body.password, {"N":16,"r":1,"p":1},64,"", (err, hash) ->
      payload =
        name: req.body.name
        firstname: req.body.firstname
        surname: req.body.surname
        birthday: moment(req.body.birthday).format()
        RefererId: (if req.body.refererId then parseInt(req.body.refererId) else null)
        email: req.body.email
        password: req.body.password
        authentication: 'password:scrypt:'+hash.toString('hex')
        mobile: req.body.mobile
        photo: req.body.photo

        event:
          from: moment(req.body.present.start).format()
          until: moment(req.body.present.end).format()
          FavoritePartners: req.body.favoritePartners
          favoritePositions: req.body.favoritePositions
          maxLoad: 100




      @dispatch(constants.CREATE, payload)

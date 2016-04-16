
module.exports = (sequelize, DataTypes) ->
  sequelize.define("User",
    email: DataTypes.STRING
    firstname: DataTypes.STRING
    surname: DataTypes.STRING
    name: DataTypes.STRING
    password: DataTypes.STRING
    photo: DataTypes.TEXT
    birthday: DataTypes.DATE
    mobile: DataTypes.STRING
    recieveSMS: DataTypes.BOOLEAN
    moderator: DataTypes.BOOLEAN
    RefererId: DataTypes.INTEGER
    {indexes: [{unique: true, fields: ['email']}]}
  )

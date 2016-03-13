@MR.module "Users", (Users, App, Backbone, Marionette, $, _) ->

  class Users.Router extends Mn.AppRouter
    "users/"         : "showUsers"
    "users/user/:id" : "showUser"

  API = 
    showUsers: ->
      Users.List.Controller.show()
    showUser: (user) ->
      Users.User.Show.Controller.show(user)

  App.vent.on "user:show", (user) ->
    Backbone.history.navigate "users/user/#{user.cid}"
    API.showUser(user)

  Users.on "start", ->
    API.showUsers()

  App.addInitializer ->
    new Users.Router
      controller: API
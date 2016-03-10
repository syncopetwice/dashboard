@MR.module "Users", (Users, App, Backbone, Marionette, $, _) ->

  class Users.Router extends Mn.AppRouter
    appRoutes:
      "users"             : "users"
      "users/user/:model" : "user"

  API = 
    users: ->
      Users.Show.Controller.show()
    user: (model) ->
      Users.User.Show.Controller.show(model)

  App.vent.on "user:clicked", (model) ->
    Backbone.history.navigate("users/user/#{model.get('url')}")
    API.user model

  Users.on "start", ->
    API.users()

  App.addInitializer ->
    new Users.Router
      controller: API
@MR.module "Users", (Users, App, Backbone, Marionette, $, _) ->

  class Users.Router extends Mn.AppRouter
    controller: API
    appRoutes:
      "users" : "list"

  API =
    list: ->
      Users.List.Controller.list()

  # Events
  App.vent.on "user:back", ->
    App.navigate "users", trigger: true

  App.addInitializer ->
    new Users.Router
      controller: API
@MR.module "Users", (Users, App, Backbone, Marionette, $, _) ->

  class Users.Router extends Mn.AppRouter
    controller: API
    appRoutes:
      "users" : "list"

  API = 
    list: ->
      Users.List.Controller.list()
    search: (query) ->
      console.log "Users App Search #{query}"

  Users.on "start", ->
    API.list()

  # Events
  App.vent.on "user:back", ->
    App.navigate "users", trigger: true
    API.list()

  # Search
  App.vent.on "user:search", ->
    console.log @
    console.log "User Trigger"

  App.addInitializer ->
    new Users.Router
      controller: API

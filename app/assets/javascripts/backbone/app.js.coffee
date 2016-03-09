@MR = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.rootRoute = "users"

  App.addRegions
    mainRegion : "#application"
    usersRegion: "#users-region"
    userRegion: "#user-region"

  App.on "start", (options) ->
    if options.history
      if Backbone.history
        Backbone.history.start()
        @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""
    else
      throw new Error ("History is off")

    App.module("UsersApp").start()

  App

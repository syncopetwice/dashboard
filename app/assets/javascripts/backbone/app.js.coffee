@MR = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.rootRoute = "users"

  App.addRegions
    mainRegion : "#application"

  App.on "start", () ->
    if Backbone.history
      Backbone.history.start()
      @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""

    App.module("Users").start()

  App

###
TODO LIST:
  create LAYOUT FOR USER
  add routes
###
@MR = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.rootRoute = "users"

  App.addRegions
    application : "#application"

  App.on "start", () ->
    if Backbone.history
      Backbone.history.start() unless Backbone.History.started
      @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""

  App
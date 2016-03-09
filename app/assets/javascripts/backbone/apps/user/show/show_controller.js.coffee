@MR.module "UserApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: (id) ->
      view = @getView()
      App.userRegion.show view

    getView: ->
      new Show.User
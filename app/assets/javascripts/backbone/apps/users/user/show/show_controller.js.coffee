@MR.module "Users.User.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: (model) ->
      view = @getView model
      App.mainRegion.show view

    getView: (model)->
      new Show.User
        model: model
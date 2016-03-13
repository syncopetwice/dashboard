@MR.module "Users.User.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =
    show: (user) ->
      view = @getView user
      App.mainRegion.show view

    getView: (user) ->
      new Show.User
        model: user
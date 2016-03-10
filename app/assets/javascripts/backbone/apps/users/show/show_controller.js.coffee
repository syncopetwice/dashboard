@MR.module "Users.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: ->
      collection = App.request "users:entities"
      view = @getView collection

      view.on "childview:user:clicked", (view, model) ->
        App.vent.trigger "user:clicked", model

      App.mainRegion.show view

    getView: (users) ->
      new Show.Users
        collection: users
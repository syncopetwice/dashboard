@MR.module "Users.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    show: ->
      users = App.request "users:entities"
      view = @getView users
      view.on "childview:user:delete", (iv, model) ->
        users.remove(model)
      view.on "childview:user:show", (iv, model) ->
        App.vent.trigger "user:show", model
      App.mainRegion.show view

    getView: (users) ->
      new List.Users
        collection: users
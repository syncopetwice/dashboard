@MR.module "UsersApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: ->
      collection = App.request "users:entities"
      view = @getView collection
      App.usersRegion.show view

    getView: (users) ->
      new Show.Users
        collection: users
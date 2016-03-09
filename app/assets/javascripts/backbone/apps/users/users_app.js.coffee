@MR.module "UsersApp", (UsersApp, App, Backbone, Marionette, $, _) ->

  API = 
    show: ->
      UsersApp.Show.Controller.show()

  UsersApp.on "start", ->
    API.show()
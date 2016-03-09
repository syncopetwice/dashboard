@MR.module "UserApp", (UserApp, App, Backbone, Marionette, $, _) ->

  API = 
    show: (id) ->
      UserApp.Show.Controller.show()

  UserApp.on "start", ->
    API.show()
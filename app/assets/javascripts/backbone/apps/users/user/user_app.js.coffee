@MR.module "Users.User", (User, App, Backbone, Marionette, $, _) ->

  API = 
    show: (model) ->
      console.log model
      Users.User.Show.Controller.show model
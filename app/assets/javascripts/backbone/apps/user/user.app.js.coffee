@MR.module "User", (User, App, Backbone, Marionette, $, _) ->

  @startWithParent = false

  class User.Router extends Mn.AppRouter
    controller: API
    appRoutes:
      "users/user/:id/show" : "show"

  API =
    show: (id) ->
      User.Show.Controller.show id

  User.on "start", ->
    API.show()

  App.vent.on "user:show", (user) ->
    App.navigate "users/user/#{user.attributes.id}", {trigger: true}
    API.show user

  App.addInitializer ->
    new User.Router
      controller: API
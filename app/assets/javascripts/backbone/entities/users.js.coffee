@MR.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.User extends Entities.Model

  class Entities.Users extends Entities.Collection
    model: Entities.User
    url: "users"

  API =
    getUsers: ->
      users = new Entities.Users
      users.fetch
        reset: true
      users

  App.reqres.setHandler "users:entities", ->
    API.getUsers()
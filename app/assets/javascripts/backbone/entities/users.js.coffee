@MR.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.User extends Entities.Model

  class Entities.Users extends Entities.Collection
    model: Entities.User

  API =
    getUsers: ->
      new Backbone.Collection [
        {
          representative: "George Kenessey"
          team: "West Coast"
          coach: "David Director"
          startDate: "Jan 1, 2013"
          endDate: "Dec 31, 2013"
        }
        {
          representative: "Christopher Nolan"
          team: "East Coast"
          coach: "Craig Bellamy"
          startDate: "March 5, 2012"
          endDate: "Sep 2, 2017"
        }
      ]

  App.reqres.setHandler "users:entities", ->
    API.getUsers()
@MR.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.User extends Entities.Model
    defaults:
      "avatar" : "https://www.tm-town.com/assets/default_male600x600-79218392a28f78af249216e097aaf683.png"
      "annualSalesObjeective": "TEST"
      "team" : "TEST"
      "coach": "TEST"
      "startDate" : "TEST"
      "endDate" : "TEST"
      "closed" : "1"
      "closedOf" : "10"
      "newOpportunities" : "5"
      "newOpportunitiesOf" : "10"
      "sales" : "200,000"
      "target" : "400,000"

      "opportunityList" : [
        {
          name: "NAME"
          account: "ACCOUNT"
          amount: "$300,000.00"
          stage: "Identifying"
          closeDate: "4/17/2013"
          winProbability: "50%"
          representative: "representative"
        }
        {
          name: "NAME"
          account: "ACCOUNT"
          amount: "$300,000.00"
          stage: "Identifying"
          closeDate: "4/17/2013"
          winProbability: "50%"
          representative: "representative"
        }
      ]


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

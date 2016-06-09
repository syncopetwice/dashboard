@MR.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.User extends Entities.Model
    defaults:
      "avatar" : "https://www.tm-town.com/assets/default_male600x600-79218392a28f78af249216e097aaf683.png"
      "annualSalesObjeective": "$2,400,000"
      "team" : "West Coast"
      "coach": "David Director"
      "startDate" : "Jan 1, 2013"
      "endDate" : "Dec 31, 2013"
      "closed" : "3"
      "closedOf" : "7"
      "newOpportunities" : "9"
      "newOpportunitiesOf" : "20"
      "sales" : "300,000"
      "target" : "450,000"

      "opportunityList" : [
        {
          name: "Burlington - Widgets 300K"
          account: "Burlington Textiles Corp of America"
          amount: "$300,000.00"
          stage: "Identifying"
          closeDate: "4/17/2018"
          winProbability: "50%"
          representative: "Carl Rep"
        }
        {
          name: "Burlington - Line Equip"
          account: "Burlington Textiles Corp of America"
          amount: "$100,000.00"
          stage: "Proposing"
          closeDate: "7/25/2017"
          winProbability: "65%"
          representative: "George Kenessey"
        }
        {
          name: "Burlington - New Widgets"
          account: "Burlington Textiles Corp of America"
          amount: "$200,000.00"
          stage: "Identifying"
          closeDate: "3/22/2018"
          winProbability: "35%"
          representative: " Fred Manager"
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
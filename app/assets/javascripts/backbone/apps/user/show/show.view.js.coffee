@MR.module "User.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends Mn.LayoutView
    template: "user/show/templates/layout"
    className: "user"
    regions:
      details: "#user-details-region"
      charts:  "#user-charts-region"
      opportunity: "#user-opportunity-region"

    events:
      "click [data-role='back']": "back"

    back: ->
      App.vent.trigger "user:back"

  class Show.Details extends Mn.ItemView
    template: "user/show/templates/_details"
    className: "user-details"

  class Show.Charts extends Mn.ItemView
    template: "user/show/templates/_charts"
    className: "user-charts"

  class Show.Opportunity extends Mn.ItemView
    template: "user/show/templates/_opportunity"
    className: "user-opportunity"
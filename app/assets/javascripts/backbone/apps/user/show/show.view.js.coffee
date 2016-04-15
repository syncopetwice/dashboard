@MR.module "User.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends Mn.LayoutView
    template: "user/show/templates/layout"
    className: "user"
    regions:
      details: "#user-details-region"
      charts:  "#user-charts-region"

    events:
      "click [data-role='back']": "back"

    back: ->
      App.vent.trigger "user:back"

  class Show.Detail extends Mn.ItemView
    template: "user/show/templates/_detail"
    tagName: "tr"

  class Show.Details extends Mn.CompositeView
    template: "user/show/templates/_details"
    className: "user-details"
    childView: Show.Detail
    childViewContainer: "tbody"

  class Show.Charts extends Mn.ItemView
    className: "user-charts"
    template: "user/show/templates/_charts"
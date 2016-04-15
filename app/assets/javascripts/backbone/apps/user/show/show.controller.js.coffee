@MR.module "User.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: (users) ->
      users = App.request "users:entities"
      App.execute "when:fetched", users, =>
        @layout = @getLayout()
        @layout.on "show", =>
          @showDetails users
          @showCharts users
        App.application.show @layout

    # Actions
    showDetails: (users) ->
      view = @getDetailsView users
      @layout.details.show view

    showCharts: (users) ->
      view = @getChartsView users
      @layout.charts.show view

    # Views

    getDetailsView: (users) ->
      new Show.Details
        collection: users

    getChartsView: (users) ->
      new Show.Charts
        collection: users

    getLayout: (users) ->
      new Show.Layout

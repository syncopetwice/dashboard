@MR.module "User.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: (model) ->

      users = App.request "users:entities"

      App.execute "when:fetched", users, =>
        user =  users.get(model)
        console.log user
        @layout = @getLayout()
        @layout.on "show", =>
          @showDetails user
          @showCharts user
          @showOpportunity user
        App.application.show @layout

    # Actions
    showDetails: (user) ->
      view = @getDetailsView user
      @layout.details.show view

    showCharts: (user) ->

      data = 
        labels: [ '1', '2', '3', '4', '5', '6' ]
        series: [ { data: [1, 2, 3, 5, 8, 13] } ]

      options = axisX: labelInterpolationFnc: (value) ->
        'Week ' + value

      chartSalesCycle =
        data:
          labels: ['Bananas', 'Apples', 'Grapes']
          series: [20, 15, 40]

        options: labelInterpolationFnc: (value) ->
          value[0]

      view = @getChartsView user
      @layout.charts.show view

      # Initialize charts
      new (Chartist.Line)('#chart--new-opportunities', data, options)
      new (Chartist.Line)('#chart--proposals', data, options)
      new (Chartist.Pie)('#chart--sales-cycle', chartSalesCycle.data, chartSalesCycle.options)
      new (Chartist.Line)('#chart--proposal-ratio', data, options)
      new (Chartist.Line)('#chart--closing-ratio', data, options)
      new (Chartist.Line)('#chart--avg-value', data, options)

    showOpportunity: (user) ->
      view = @getOpportunityView user
      @layout.opportunity.show view

      # Config for jQuery.dataTable
      config =
        info: false,
        'columnDefs': [ {
          'targets': [ 5 ]
          'orderable': false
        } ]
        'aLengthMenu': [
          [ 5, 10, 15, -1 ]
          [ 5, 10, 15, 'All' ]
        ]
        'iDisplayLength': 5

      # jQuery plugin for tables
      $("#opportunity-table").DataTable(config)

    # Views

    getDetailsView: (user) ->
      new Show.Details
        model: user

    getChartsView: (user) ->
      new Show.Charts
        model: user

    getOpportunityView: (user) ->
      new Show.Opportunity
        model: user

    getLayout: (user) ->
      new Show.Layout
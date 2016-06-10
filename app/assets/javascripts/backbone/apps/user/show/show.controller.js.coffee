@MR.module "User.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: (model) ->
      users = App.request "users:entities"
      App.execute "when:fetched", users, =>
        user =  users.get(model)
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

      view = @getChartsView user
      @layout.charts.show view

      # Initialize charts
      new (Chartist.Line)('#chart--new-opportunities',

        {
          labels: [1, 2, 3, 4, 5],
          series: [
            [1, 5, 10, 0, 1],
            [10, 15, 0, 1, 2]
          ]
        }, {
          lineSmooth: Chartist.Interpolation.simple({
            divisor: 2
          }),
          fullWidth: true,
          chartPadding: {
            right: 20
          },
          low: 0
        }

      )

      new (Chartist.Line)('#chart--proposals',
        { labels: [1, 2, 3, 4, 5, 6, 7, 8], series: [[5, 9, 7, 8, 5, 3, 5, 4]]},
        { low: 0, showArea: true }
      )
      new (Chartist.Bar)('#chart--sales-cycle', {
        labels: [
          'Q1'
          'Q2'
          'Q3'
          'Q4'
        ]
        series: [
          [
            800000
            1200000
            1400000
            1300000
          ]
          [
            200000
            400000
            500000
            300000
          ]
          [
            100000
            200000
            400000
            600000
          ]
        ]
      },
        stackBars: true
        axisY: labelInterpolationFnc: (value) ->
          value / 1000 + 'k'
      ).on 'draw', (data) ->
        if data.type == 'bar'
          data.element.attr style: 'stroke-width: 30px'
        return
      
      sum = (a, b) ->
        a + b
      new (Chartist.Pie)(
        '#chart--proposal-ratio',
        series: [5,3,4],
        labelInterpolationFnc: (value) ->
          Math.round(value / data.series.reduce(sum) * 100) + '%'
      )

      new (Chartist.Bar)(
        '#chart--closing-ratio',
        {
          labels: ['W1', 'W2', 'W3', 'W4', 'W5', 'W6', 'W7', 'W8', 'W9', 'W10',]
          series: [ [ 1, 2, 4, 8, 6, -2, -1, -4, -6, -2,] ]
        },
        {
          high: 10
          low: -10
          axisX: labelInterpolationFnc: (value, index) ->
            if index % 2 == 0 then value else null
        }
      )

      new (Chartist.Bar)('#chart--avg-value', {
        labels: [
          'Monday'
          'Tuesday'
          'Wednesday'
          'Thursday'
          'Friday'
          'Saturday'
          'Sunday'
        ]
        series: [
          [ 5, 4, 3, 7, 5, 10, 3]
          [ 3,2,9,5,4,6,4]
        ]
      },
        seriesBarDistance: 10
        reverseData: true
        horizontalBars: true
        axisY: offset: 70)

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
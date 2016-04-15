do (Backbone) ->
  _.extend Backbone.Marionette.Application::,

    navigate: (route, options = {}) ->
      route = "#/" + route
      Backbone.history.navigate route, options

    getCurrentRoute: ->
      Backbone.history.fragment
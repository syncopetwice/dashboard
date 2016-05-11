@MR.module "Users.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    list: ->
      users = App.request "users:entities"

      # Execute
      App.execute "when:fetched", users, =>

        # Get View
        view = @getView users

        # Render
        App.application.show view

        # Config for jQuery.dataTable
        config =
          'columnDefs': [ {
            'targets': [ 5 ]
            'orderable': false
          } ]
          'aLengthMenu': [
            [ 10, 25, -1 ]
            [ 10, 25, 'All' ]
          ]
          'iDisplayLength': 10

        # jQuery plugin for tables
        $("#users-table").DataTable(config)

        # Events
          # Show
        view.on "childview:user:show", (iv, model) ->
          App.vent.trigger "user:show", model
          
    getView: (users) ->
      new List.Users
        collection: users
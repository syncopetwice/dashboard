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

        # Events
          # Show
        view.on "childview:user:show", (iv, model) ->
          App.vent.trigger "user:show", model
          # Delete
        view.on "childview:user:delete", (iv, model) ->
          console.log "Model remove"
          model.destroy()
          
    getView: (users) ->
      new List.Users
        collection: users
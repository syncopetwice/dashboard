@MR.module "Users.List", (List, App, Backbone, Marionette, $, _) ->

  class List.User extends Mn.ItemView
    template: "users/list/templates/_user"
    tagName: "tr"

    events:
      "click .js-show"         : "show"
      "click .js-delete"       : "delete"

    # Events
    show: (ev) ->
      @trigger "user:show", @model

    delete: (ev) ->
      @trigger "user:delete", @model

  class List.Empty extends Mn.ItemView
    template: "users/list/templates/_empty"
    tagName: "tr"

  class List.Users extends Mn.CompositeView
    template: "users/list/templates/users"
    childView: List.User
    childViewContainer: "tbody"
    emptyView: List.Empty

    events:
      "keyup .js-search-input": -> App.vent.trigger "user:search"
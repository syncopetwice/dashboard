@MR.module "UsersApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.User extends Mn.ItemView
    template: "users/show/templates/_user"

  class Show.Users extends Mn.CompositeView
    template: "users/show/templates/users"
    childView: Show.User
    childViewContainer: ".users"
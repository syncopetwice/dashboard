@MR.module "Users.User.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.User extends Mn.ItemView
    template: "users/user/show/templates/user"
@MR.module "UserApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.User extends Mn.ItemView
    template: "user/show/templates/user"
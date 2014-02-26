# Load App Helpers
require 'lib/helpers'

# Namespace
@Flamingo            = {}
Flamingo.Routers     = {}
Flamingo.Collections = {}
Flamingo.Views       = {}
Flamingo.Models      = {}

$ ->
    Flamingo.Routers.MainRouter = new MainRouter = require 'routers/main'

    # Initialize Backbone History
    Backbone.history.start pushState: no
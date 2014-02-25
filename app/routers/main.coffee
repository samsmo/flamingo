PostsEditView = require 'views/content_types/posts/edit'
IndexView = require('views/pages/index')
AppView = require 'views/app'

module.exports = class MainRouter extends Backbone.Router
    routes:
        '': 'index'
        'posts_edit': 'postEdit'
    currentView: null
    init: false
    initialize: ->
        that = @
        #Create main view
        AppView = new AppView()
        #Handle real URLS without page refresh
        $(document).on 'click', 'a:not([data-bypass])', (evt) ->
            href = $(this).attr 'href'
            protocol = this.protocol + '//'

            if href.slice(protocol.length) isnt protocol
                evt.preventDefault()

                if href isnt Backbone.history.fragment
                    that.pageChange(href)
    index: ->
        @currentView = AppView.createPage(new IndexView())
    postEdit: ->
        @currentView = AppView.createPage(new PostsEditView())
    pageChange: (href)->
        @currentView.destroy()
        @navigate href, true
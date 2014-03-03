PostsCollection = require('collections/posts')
PostView = require 'views/content_types/posts/show'
IndexView = require('views/pages/index')
PostModel = require('models/post')
AppView = require 'views/app'

module.exports = class MainRouter extends Backbone.Router
    routes:
        '': 'index'
        'posts/:id': 'showPost'
    currentView: null
    posts: null
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
        @posts ?= new PostsCollection()
        @currentView = AppView.createPage(new IndexView({collection: @posts}))
    showPost: (param) ->
        if @posts
            post = @posts.findWhere({ _id: param })
        else
            post = new PostModel({id : param})
            post.fetch()

        @currentView = AppView.createPage(new PostView({model: post}))
    pageChange: (href)->
        @currentView.destroy()
        @navigate href, true
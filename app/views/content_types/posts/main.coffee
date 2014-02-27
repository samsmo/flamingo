PostItem        = require('views/content_types/posts/list')
Base            = require('views/base')

module.exports = class PostsMainView extends Base
    tpl: require('views/content_types/posts/templates/list')
    events:
        'click add-post': 'addPost'
    postInit: ->
        @listenTo @collection, 'add', @addPost
    postRender: ->
        that = @
        if @collection && @collection.models
            _.each @collection.models, (post)->
                that.addPost(post)
    addPost: (post)->
        @addView(new PostItem({model: post}))

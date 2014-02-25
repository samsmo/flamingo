PostsCollection = require('collections/posts')
Base            = require('views/base')

module.exports = class PostsMainView extends Base
    el: '.blog-roll'
    tpl: require('views/content_types/posts/templates/list')
    events:
        'click add-post': 'addPost'
    postInit: ->
        Flamingo.Collections.PostsCollection = new PostsCollection()
        @listenTo Flamingo.Collections.PostsCollection, 'add', @addPost
    addPost: ->
        console.log 'add a post'

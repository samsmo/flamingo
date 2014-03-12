Post = require('models/post')
module.exports = class PostCollection extends Backbone.Collection
    page: 1
    limit: 5
    url: ()->
        '/api/posts?page=' + @page + '&limit=' + @limit
    model: Post
    initialize: ->
        @fetch()
        @listenTo Backbone.Events, 'post:added', @save
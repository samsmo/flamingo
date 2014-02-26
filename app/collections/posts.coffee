Post = require('models/post')
module.exports = class PostCollection extends Backbone.Collection
    url: '/api/posts'
    model: Post
    initialize: ->
        @fetch()
        @listenTo Backbone.Events, 'post:added', @add
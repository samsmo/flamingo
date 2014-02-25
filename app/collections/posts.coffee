module.exports = class PostCollection extends Backbone.Collection
    initialize: ->
        @listenTo Backbone.Events, 'post:added', @add
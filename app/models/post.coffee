module.exports = class PostModel extends Backbone.Model
    url: '/api/posts'
    initialize: ->
        
    validate: (attrs, opts) ->
        #validate the model
module.exports = class PostModel extends Backbone.Model
    urlRoot: '/api/posts'
    initialize: ->
        
    validate: (attrs, opts) ->
        #validate the model
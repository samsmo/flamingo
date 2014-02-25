module.exports = class PostModel extends Backbone.Model
    initialize: ->
        console.log "created model"
    validate: (attrs, opts) ->
        if (attrs.title.length > 5 && attrs.content.length > 5)
            console.log "content here"
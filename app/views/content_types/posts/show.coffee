Page           = require('views/content_types/pages/page')
PostModel      = require('models/post')

module.exports = class PostsShowView extends Page
    tpl: require('views/content_types/posts/templates/show')
    postInit: ->
        console.log @model
        @listenTo @model, 'sync', @render
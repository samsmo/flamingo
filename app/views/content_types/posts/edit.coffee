PostModel = require('models/post')
Page      = require('views/content_types/pages/page')

module.exports = class PostsEditView extends Page
    tpl: require('views/content_types/posts/templates/edit')
    events:
        'click .submit': 'handleForm'
    postInit: ->
        Model = new PostModel()
        console.log @collection
    handleForm: (e) ->
        e.preventDefault()
        post =
            'title' : $.trim @$el.find('input#title').val()
            'description': $.trim @$el.find('textarea#description').val()
        @collection.add post
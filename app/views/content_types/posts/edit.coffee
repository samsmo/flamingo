PostModel = require('models/post')
Page      = require('views/content_types/pages/page')

module.exports = class PostsEditView extends Page
    tpl: require('views/content_types/posts/templates/edit')
    events:
        'click .submit': 'handleForm'
    postInit: ->
        Model = new PostModel()
    handleForm: (e) ->
        e.preventDefault()
        post =
            'title' : $.trim @$el.find('input#title').val()
            'text': $.trim @$el.find('input#search').val()
        Flamingo.Collections.PostsCollection.add(post)
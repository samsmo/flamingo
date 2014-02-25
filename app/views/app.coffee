module.exports = class AppView extends Backbone.View
    el: 'section.app'
    initialize: ->
    createPage: (view) ->
        @$el.html(view.render().$el)
        view
        
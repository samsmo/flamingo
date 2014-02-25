module.exports = class BaseView extends Backbone.View
    tagName: 'div'
    children: []
    initialize: ->
        @postInit()
    postInit: ->
        #override
    addView: (view) ->
        @children.push view
        @$el.append view.tpl
        view
    destroy: ->
        @children[i].remove() for child, i in @children
        @remove()
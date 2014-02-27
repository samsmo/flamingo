module.exports = class BaseView extends Backbone.View
    tagName: 'div'
    children: []
    model: null
    initialize: ->
        @postInit()
    postInit: ->
        #override
    addView: (view) ->
        @children.push view
        @$el.append view.render().$el
        view
    render: () ->
        data = if @model then @model.toJSON() else {}
        that = @
        @$el.append @tpl(data)
        setTimeout ( ->
            that.postRender()
        ), 0
        this
    postRender: ->
        #override
    destroy: ->
        @children[i].remove() for child, i in @children
        @remove()
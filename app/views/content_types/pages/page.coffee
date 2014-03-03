BaseView = require('views/base')

module.exports = class PageView extends BaseView
    render: ->
        data = if @model then @model.toJSON() else {}
        @$el.css({'opacity' : 0}).animate({'opacity': 1}, 1000).append @tpl(data)
        this
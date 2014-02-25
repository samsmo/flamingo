BaseView = require('views/base')

module.exports = class PageView extends BaseView
    render: ->
        @$el.css({'opacity' : 0}).animate({'opacity': 1}, 1000).append @tpl
        this
PostsMainView = require('views/content_types/posts/main')
PageView      = require('views/content_types/pages/page')

module.exports = class IndexView extends PageView
    tagName: 'div'
    tpl: require 'views/templates/index'
    postInit: ->
        PostsView  = @addView(new PostsMainView({collection: @collection}))
Base = require('views/base')
module.exports = class PostsListView extends Base
    el: '.roll'
    tpl: require('views/content_types/posts/templates/item')
    render:->
        console.log 'test'
        @$el.html(@tpl(@model.toJSON()))
        this
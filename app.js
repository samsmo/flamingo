
/**
 * Module dependencies.
 */

var express = require('express'),
    routes = require('./routes'),
    post = require('./routes/posts'),
    admin = require('./routes/admin'),
    http = require('http'),
    path = require('path'),
    mongo = require('mongoskin'),
    db = mongo.db('mongodb://localhost:27017/flamingo-springs')

var app = express();

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
app.use(express.cookieParser('your secret here'));
app.use(express.session());
app.use(app.router);
app.use(require('stylus').middleware(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'public')));
app.use(function(req, res){
    res.redirect('/');
});
// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}
//Admin Route Filter [Auth Required]
app.all('/admin*', function (req, res, next){
    if(!req.session.user){
        res.redirect('/login');
    }else{
        next();
    }
});

//Basic routes
app.get('/', routes.index);
app.get('/api/posts', post.list(db));
app.post('/api/posts', post.create(db));
app.put('/api/posts', post.update(db));
app.del('/api/posts', post.destroy(db));

/** Admin Routes **/
app.get('/admin', admin.list(db));
app.get('/login', admin.login(db));
app.post('/login', admin.auth(db));
app.get('/logout', admin.logout);

/** Admin Store / Etsty Routes **/
app.get('/admin/store', admin.store.list(db));
/** Admin Page Routes **/
app.get('/admin/pages', admin.pages.list(db));
/** Admin Blog Routes **/
app.get('/admin/blog', admin.blog.list(db));
/** Admin Gallery Routes **/
app.get('/admin/gallery', admin.gallery.list(db));

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});

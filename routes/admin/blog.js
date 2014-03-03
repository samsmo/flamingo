exports.create = function (db) {
    return function (req, res) {
        var data = req.body;
        db.collection('postlist').insert( data, function (err, item) {
            var type = (err) ? 'error' : 'success';
            res.json({type: 'successfully added post!'});
        });
    };
};

exports.list = function (db) {
    return function (req, res) {
        var page = (req.params.page) ? (req.params.page - 1) : 0,
            skip = page * 10;
        db.collection('postlist').find().skip(skip).limit(10).toArray(function (err, items) {
            res.render('admin/pages/blog/index', { 'posts': items });
        });
    };
};

exports.edit_get = function (db) {
    return function (req, res) {
        var id = req.params.id;
        if(id) {
            db.collection('postlist').findById(id, function (err, items) {
                if(!err){
                    res.render('admin/pages/blog/edit', { 'post' : items });
                } else {
                    res.send('Sorry, there was an error finding this page! click <a href="/admin">here</a> to leave');
                }
            });
        }else {
            res.redirect('/admin/blog');
        }
    };
};

exports.edit_post = function (db) {
    return function (req, res) {
        var data = req.body,
            id   = req.params.id;
        if (id && data) {
            db.collection('postlist').updateById(id, {$set: {title: data.title, description: data.description}, }, function (err) {
                if (err) {
                    return res.send(err);
                } else {
                    res.redirect('/admin/blog');
                }
            });
        }
    };
};
exports.destroy = function (db) {
    return function (req, res) {
        
    };
};
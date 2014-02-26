
/*
 * GET users listing.
 */

exports.list = function(db) {
    return function(req, res){
        db.collection('postlist').find().toArray(function (err, items) {
            res.json(items);
        });
    };
};

exports.create = function(db) {
    return function(req, res){
        var data = req.body.data;
        db.collection('postlist').insert( function (err, item){
            var type = (err) ? 'error' : 'success';
            res.json({type: 'successfully added post!'});
        });
    };
};

exports.update = function(db) {
    return function(req, res){
        var data = req.body.data;
        db.collection('postlist').insert( function (err, item){
            var type = (err) ? 'error' : 'success';
            res.json({type: 'successfully added post!'});
        });
    };
};

exports.destroy = function(db) {
    return function(req, res){
        var data = req.body.data;
        console.log(data);
        /*db.collection('postlist').remove( data,  function (err, item){
            var type = (err) ? 'error' : 'success';
            res.json({type: 'successfully added post!'});
        });*/
    };
};
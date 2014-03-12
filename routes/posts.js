/*
 * GET users listing.
 */

exports.list = function (db) {
    return function (req, res){
        page  = (req.query.page) ? parseInt(req.query.page, 10) : 0;
        limit = (req.query.limit) ? parseInt(req.query.limit, 10) : 0;
        skip  = page * limit;
        db.collection('postlist').find().limit(limit).skip(skip).toArray(function (err, items) {
            res.json(items);
        });
    };
};

exports.show = function (db) {
    return function (req, res) {
        var id = req.params.id;
        db.collection('postlist').findById(id, function (err, items){
            if(err){
                return res.json(err);
            }else {
                return res.json(items);
            }
        });
    };
};
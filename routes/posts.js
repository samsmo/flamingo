
/*
 * GET users listing.
 */

exports.list = function (db) {
    return function (req, res){
        db.collection('postlist').find().toArray(function (err, items) {
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
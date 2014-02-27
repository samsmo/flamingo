exports.list = function(db) {
    return function(req, res){
        res.send(req.session.user_id);
    };
};

exports.login = function(db) {
    return function(req, res){
        res.render('admin/login');
    };
};

exports.auth = function(db) {
    return function(req, res) {
        var data = req.body,
            user;
        if(!req.session.user_id){
            user = db.collection('users').find({'username':data.username});
            console.log(user);
            if(user.password === data.password){
                req.session.user_id = user._id;
                res.redirect('/admin');
            }
        }else{
            res.redirect('/admin');
        }
    };
};
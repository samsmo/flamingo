exports.list = function (db) {
    return function (req, res) {
        res.render('admin/pages/gallery/index');
    };
};
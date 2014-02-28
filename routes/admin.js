"use strict";

/** Sub Routes for admin **/
exports.pages = require('./admin/pages');
exports.blog = require('./admin/blog');
exports.gallery = require('./admin/gallery');
exports.store = require('./admin/store');

/** Admin Route Functions **/
exports.list = function (db) {
    return function (req, res) {
        res.render('admin/index', req.session.user);
    };
};

exports.login = function (db) {
    return function (req, res) {
        res.render('admin/login');
    };
};

exports.logout = function (req, res) {
    req.session.user = null;
    res.redirect('/');
};

exports.auth = function (db) {
    return function (req, res) {
        var data = req.body;
        if (!req.session.user_id){
            db.collection('users').find({'username': data.username}).toArray(function (err, results) {
                if (results.length > 0) {
                    if (results[0].password === data.password) {
                        req.session.user = results[0];
                        res.redirect('/admin');
                    } else {
                        res.send('Username and Password do not match');
                        res.redirect('/login');
                    }
                } else {
                    res.redirect('login');
                }
            });
        } else {
            res.redirect('/admin');
        }
    };
};
var express = require('express');
var router = express.Router();
var passport = require('./passport');

/* GET users listing. */
router.get('/', function (req, res, next) {
  let status = req.query.status;
  /* res.send('respond with a resource'); */
  res.render('users', { message: status });
});

/* Post users Login. */
router.post('/', function (req, res, next) {
  passport.authenticate('local', function (data, err) {
    if (err) {
      res.redirect('/users?status=' + encodeURIComponent('Error Login!!'));
      console.log(err.name + ':' + err.message);
    } else {
      if (data.user != null) {
        res.cookie('jwtoken', data.token);
        res.cookie('loggeduser', data.user);
        res.redirect('/');
      }
      else {
        res.redirect('/users?status=' + encodeURIComponent('Incorrect login details!!'));
      }
    }
  })(req, res, next);
});

// GET user Logout
router.get('/logout', function (req, res, next) {
  res.clearCookie('jwtoken');
  res.clearCookie('loggeduser');
  res.redirect('/users');
});

module.exports = router;

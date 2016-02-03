var express = require('express'),
    path = require('path'),
    request = require('request'),
    app = express();

app.get('*', function(req, res, next) {
    var acceptHeaders = req.headers.accept || [],
        hasHtmlHeader = acceptHeaders.indexOf('text/html') !== -1;
    if (hasHtmlHeader) {
        res.sendFile('index.html', {
            root: __dirname + '/dist/'
        });
    } else {
        next();
    }
});

app.use(express.static(path.join(__dirname, 'dist/')));

var server = app.listen(3000, function() {
    var host = server.address().address;
    var port = server.address().port;
    console.log('Server listening at http://%s:%s', host, port);
});

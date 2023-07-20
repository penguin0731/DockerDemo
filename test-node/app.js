const express = require('express');
const app = express();

// 静态资源
app.use(express.static('public'));

app.get('/api/getSomeThing', (request, response) => {
    response.writeHead(200, {
        "Access-Control-Allow-Origin": "*"
    })
    const resp = {
        code: 0,
        data: 'This is message from node app.'
    }
    response.write(JSON.stringify(resp));
    response.end();
})

app.listen(5000, () => {
    console.log('server is running in http://localhost:5000');
})
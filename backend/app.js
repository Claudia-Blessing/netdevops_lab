const express = require('express');

const app = express();

app.get('/health', (req, res) => {

    res.json({
        status: 'OK',
        message: 'Backend running successfully'
    });
});

app.listen(3000, () => {

    console.log('Server running on port 3000');
});


const client = require('prom-client');
const collectDefaultMetrics = client.collectDefaultMetrics;

collectDefaultMetrics();

app.get('/metrics', async (req, res) => {
    res.set('Content-Type', client.register.contentType);
    res.end(await client.register.metrics());
});

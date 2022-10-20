const path = require('path')
const shelljs = require('shelljs');
const fs = require('fs')
const express = require('express')
const app = express()
const port = 3000

app.use(express.static(path.join(__dirname, 'public')))

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.get('/info', (req, res) => {
    // process.env.PLUG_PATH;
    var info = {plug_path: process.env.PLUG_PATH}
    if (fs.existsSync(proces.env.PLUG_PATH+'/data/config')) {
        
    }
    res.json(info)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

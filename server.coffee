require 'coffee-script'
express = require 'express'

app = express.createServer()

app.get '/', (req, res) ->
  res.render 'index.eco', layout: false

app.listen(3000)
console.log "Server is listening"

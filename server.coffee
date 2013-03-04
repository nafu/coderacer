require 'coffee-script'
express = require 'express'
cons = require 'consolidate'

app = express.createServer()
app.engine 'eco', cons.eco

app.get '/', (req, res) ->
  res.render 'index.eco', layout: false

app.listen(3000)
console.log "Server is listening"

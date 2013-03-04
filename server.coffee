require 'coffee-script'
express = require 'express'
cons = require 'consolidate'

app = express()
app.engine 'eco', cons.eco

app.get '/', (req, res) ->
  res.render 'index.eco',
    title: 'Our Page Title'

app.listen(3000)
console.log "Server is listening"

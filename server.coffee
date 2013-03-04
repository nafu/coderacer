require 'coffee-script'
express = require 'express'
cons = require 'consolidate'

app = express()
app.engine 'eco', cons.eco

app.configure ->
  app.use express.static("#{__dirname}/public")

app.get '/', (req, res) ->
  res.render 'index.eco',
    title: 'Our Page Title'

app.get '/foo', (req, res) ->
  res.render 'index.eco',
    title: 'Fooo!!!'

app.listen(3000)
console.log "Server is listening"

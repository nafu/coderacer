require 'coffee-script'
express = require 'express'
cons = require 'consolidate'
less = require 'connect-lesscss'

app = express()
http = require 'http'
server = http.createServer(app)
app.engine 'eco', cons.eco
io = require('socket.io').listen(server)

app.configure ->
  app.use express.static("#{__dirname}/public")
  app.use '/application.css', less("#{__dirname}/less/application.less")

app.get '/', (req, res) ->
  res.render 'index.eco',
    title: 'Our Page Title'

app.get '/foo', (req, res) ->
  res.render 'index.eco',
    title: 'Fooo!!!'

server.listen(3000)
console.log "Server is listening"

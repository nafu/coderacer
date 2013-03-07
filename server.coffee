require 'coffee-script'
express = require 'express'
cons = require 'consolidate'
less = require 'connect-lesscss'
compiler = require 'connect-compiler'

app = express()
http = require 'http'
server = http.createServer(app)
app.engine 'eco', cons.eco
io = require('socket.io').listen(server)

app.configure ->
  app.use '/application.css', less("#{__dirname}/less/application.less")
  app.use compiler {src: "#{__dirname}/public", enabled: ['coffee']}
  app.use express.static("#{__dirname}/public")

app.get '/', (req, res) ->
  res.render 'index.eco',
    title: 'Our Page Title'

app.get '/foo', (req, res) ->
  res.render 'index.eco',
    title: 'Fooo!!!'

io.sockets.on 'connection', (socket) ->
  setTimeout () ->
    socket.emit 'server-update', "Here is a message from the server"
  , 3000

server.listen(3000)
console.log "Server is listening"

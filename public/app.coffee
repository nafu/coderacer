jQuery () ->
  socket = io.connect();

  $('#send').click () ->
    console.log "Send Clicked"

  socket.on 'server-update', (message) ->
    console.log "We have an update"
    console.log message

socket = io.connect();

socket.on 'server-update', (message) ->
  console.log "We have an update"
  console.log message

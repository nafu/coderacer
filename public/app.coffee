jQuery () ->
  socket = io.connect();

  $('#send').click () ->
    message = $('#message-text').val()
    console.log "Send Clicked", message

    socket.emit 'message-sent', message

  socket.on 'new-message', (message) ->
    li = $('<li>').text(message)
    $('#messages').append(li)

  socket.on 'server-update', (message) ->
    console.log "We have an update"
    console.log message

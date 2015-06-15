# debug =
#   logs: false
  # inputPin = new five.Pin 22
  # mux = new Mux [14, 15, 16, 17, 18, 19]
  # @loop 1, ->
  #   mux.setAt 3
  # inputPin.read (pinState) ->
  #   hasContact = pinState.value is 1
  #   console.log "read:" + hasContact
  #   if hasContact then leds.forEach (led) -> led.green()


module.exports = {MLED: MLED}

# helper functions
movesFor = (square) -> chess.moves(square: square).map (move) -> move.slice -2
coordinates = (strMove) -> 
  [letter, number] = strMove.split ''
  x = ('abcdefgh'.indexOf letter)
  y = (parseInt number)
  [x , y]

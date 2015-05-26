five = require('johnny-five')
Chess = require('chess.js').Chess

boardOpts = if isWin = /^win/.test(process.platform) then port: 'COM35' else {}
board = new (five.Board)(boardOpts)
chess = new Chess()
bled = []
rled = []
gled = []

movesFor = (square) -> chess.moves(square: square).map (move) -> move.slice -2
coordinates = (strMove) -> 
  [letter, number] = strMove.split ''
  x = ('abcdefgh'.indexOf letter)
  y = (parseInt number) - 1
  console.log [x, y]
  [x , y]
lightUp = (strMoves) -> strMoves.forEach (strMove) -> 
  console.log strMove
  [x , y] = coordinates strMove
  bled[x].low()
  gled[y].high()

board.on 'ready', ->
  # constants
  bsp = 14
  bled = (n for n in [bsp..(bsp + 7)]).map (pin) -> new five.Pin pin: pin
  rsp = 38# green start pin
  rled  = (n for n in [rsp..(rsp + 8*2 - 1)] by 2).map (pin) -> new five.Pin pin: pin
  gsp = 39
  gled  = (n for n in [gsp..(gsp + 8*2 - 1)] by 2).map (pin) -> new five.Pin pin: pin
  # Setup
  bled.forEach (Pin) -> Pin.high()
  rled.forEach (Pin) -> Pin.low()
  gled.forEach (Pin) -> Pin.low()

  # Game Routine
  lightUp movesFor 'b1'
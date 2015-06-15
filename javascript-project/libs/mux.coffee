five = require 'johnny-five'
board = new five.Board()

class Mux
  p: [1,2,4,8,16,32,64]
  constructor: ->
    @ctrlPins = (n for n in [1..6])
    @readPin = 8
    board.on 'ready', =>
      @pins = @ctrlPins.map (pin) -> new five.Pin pin: pin

  set: (n) -> # n up to 2^6
    addr = n.toString(2).split('').reverse()
    if false #debug.logs
      console.log addr, @pins.map (bitPin, index) =>
        (parseInt(addr[index]) or 0) + "->" + bitPin.pin
    @pins.forEach (bitPin, index) =>
      bitPin.write parseInt(addr[index]) or 0
    null
 
module.exports = new Mux
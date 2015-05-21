require('./polyfills')
five = require('johnny-five')
board = new (five.Board)(port: 'COM35')

class DuoLED
  constructor: (green, gnd, red) ->
    @_red = new five.Pin red
    @_gnd = new five.Pin gnd
    @_green = new five.Pin green
  red: ->
    @_red.write(1)
    @_gnd.write(0)
    @_green.write(0)

  green: ->
    @_red.write(0)
    @_gnd.write(0)
    @_green.write(1)

  off: ->
    @_red.write(0)
    @_gnd.write(0)
    @_green.write(0)

debug =
  logs: false

class Mux
  p: [1,2,4,8,16,32,64]

  constructor: (arrPins) ->
    @_pinsSemiByte = arrPins.map (intPin) -> new five.Pin intPin
  setAt: (n2p6) -> # n up to 2^6
    addr = n2p6.toString(2).split('').reverse()
    if false #debug.logs
      console.log addr, @_pinsSemiByte.map (bitPin, index) =>
        (parseInt(addr[index]) or 0) + "->" + bitPin.pin
    @_pinsSemiByte.forEach (bitPin, index) =>
      bitPin.write parseInt(addr[index]) or 0
    null


board.on 'ready', ->
  inputPin = new five.Pin 22
  mux = new Mux [14, 15, 16, 17, 18, 19]
  @loop 1, ->
    mux.setAt 3
  inputPin.read (pinState) ->
    hasContact = pinState.value is 1
    console.log "read:" + hasContact
    if hasContact then leds.forEach (led) -> led.green()

  @repl.inject
    five: five
    board: board
    DuoLED: DuoLED
    mux: mux
    debug: debug
    leds: [
      new DuoLED 30, 32, 34
      new DuoLED 36, 38, 40
      new DuoLED 42, 44, 46
      new DuoLED 48, 50, 52
    ]

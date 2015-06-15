five = require('johnny-five')
Chess = require('chess.js').Chess
_ = require('lodash')
#consts + classes
c = require './libs/config'

logOnce = (args...) -> 
  logged = false

  (() -> 
      if not logged
        logged = true
        console.log.apply null, args).apply null, args

c.board = board = new five.Board
chess = new Chess
# game state
bsp = 23
rsp = 38# green start pin
gsp = 39

currentR = [
  [0, 0, 0, 0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0, 0, 0, 0]
]
currentG = [
  [0, 0, 0, 0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0, 0, 0, 0]
]

class Mux
  p: [1,2,4,8,16,32,64]
  constructor: ->
    @ctrlPins = (n for n in [8..13])
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

class MLED
  constructor: (@y, @x) ->
  @light: (color, x, y) ->
    switch color
      # when 'none' then 
      when 'green' 
        g[y].high()
      when 'red' 
        r[y].high()
      when 'orange'
        g[y].high()
        r[y].high() 

  light: (color) -> 
    switch color
      when 'none' then [currentR, currentG].forEach (arr) -> arr[@y][@x] = 0
      when 'green' then currentG[@y][@x] = 1
      when 'red' then currentG[@y][@x] = 1
      when 'orange' then [currentR, currentG].forEach (arr) -> arr[@y][@x] = 1

# Pins Initilization
mux = new Mux
b = []
r = []
g = []

# Pins that control the grid for the leds
board.on 'ready', ->

  b = (n for n in [bsp..(bsp + 8*2 - 1)] by 2).map (pin) -> new five.Pin pin: pin
  r = (n for n in [rsp..(rsp + 8*2 - 1)] by 2).map (pin) -> new five.Pin pin: pin
  g = (n for n in [gsp..(gsp + 8*2 - 1)] by 2).map (pin) -> new five.Pin pin: pin

  b.forEach (Pin) -> Pin.high()
  r.forEach (Pin) -> Pin.low()
  g.forEach (Pin) -> Pin.low()

  # init constants

  # Setup

  # Game Routine
  [
    new MLED 0, 0  
    # new MLED 1, 1
    # new MLED 2, 2  
    # new MLED 3, 3  
    # new MLED 4, 4  
    # new MLED 5, 5  
    # new MLED 6, 6  
    # new MLED 7, 7  
  ].forEach (led) -> led.light 'green'  

  y = 0
  prevY = 0
  prevGreenY = []
  prevRedY = []
  @loop 1000, ->
    b[prevY].high()
    prevGreenY.forEach (prev) -> 
      console.log prev
      g[prev].low()
    prevRedY.forEach (prev) -> r[prev].low()
    y += 1
    prevY = y

    prevRedY = (currentR[y][x] for x in [0..7]).map (val, index) -> r[index].high()
    prevGreenY = (currentG[y][x] for x in [0..7]).map (val, index) -> g[index].high()
    b[y].low()

    if y >= 7 then y = -1
  
  @repl.inject
    r: r
    b: b
    g: g

    five: five
    board: board
    mux: mux

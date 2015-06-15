five = require 'johnny-five'
c = require './config'
board = c.board
bsp = 14
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

class MLED
	constructor: (@x, @y) -> 
		board.on 'ready', ->
			seven = (n for n in [0..7])
			setInterval((->
				if y > 7 then y = 0 else y += 1
				# seven.forEach (y) ->
				console.log y
					# b[y].low()
					# if currentR[y].includes(1) then r[y].high()
					# if currentG[y].includes(1) then g[y].high()
			), 1)
	light: (color) -> 
		switch color
			when 'none' then [currentR, currentG].forEach (arr) -> arr[@y][@x] = 0
			when 'green' then currentG[@y][@x] = 1
			when 'red' then currentG[@y][@x] = 1
			when 'orange' then [currentR, currentG].forEach (arr) -> arr[@y][@x] = 1

# Pins Initilization

# Pins that control the grid for the leds
board.on 'ready', ->
	b = (n for n in [bsp..(bsp + 7)]).map (pin) -> new five.Pin pin: pin
	r = (n for n in [rsp..(rsp + 8*2 - 1)] by 2).map (pin) -> new five.Pin pin: pin
	g = (n for n in [gsp..(gsp + 8*2 - 1)] by 2).map (pin) -> new five.Pin pin: pin

	b.forEach (Pin) -> Pin.high()
	r.forEach (Pin) -> Pin.low()
	g.forEach (Pin) -> Pin.low()

module.exports = {MLED: MLED}

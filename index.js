var five = require("johnny-five")
  , board = new five.Board({port:'COM35'})
  , NOTHING = 0
  , SOLDIER = 1
  , WASSOLDIER = 2
  , LOW = 0
  , HIGH = 1
board.on("ready", function() {
  var p7 = new five.Pin(7)
    , p7leds = [(new five.Led(8)), (new five.Led(9))]
    , p7state = NOTHING
  p7.read(function(state) {
    console.log("PIN 7: " + (state == HIGH ? "HIGH" : "LOW"))
  })
  p7.on("low", function() {
    if(p7state !== NOTHING)
      p7leds.forEach(function(led) { led.on(); })
    p7state = WASSOLDIER
  })
  p7.on("high", function() {
    if(p7state == WASSOLDIER)
      p7leds.forEach(function(led) { led.off(); })
    p7state = SOLDIER
  })
});

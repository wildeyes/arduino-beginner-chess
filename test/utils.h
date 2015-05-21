const byte maxMuxAddr = 6;
const byte valuePin = 21;
const byte muxPins[] = {14, 15, 16, 17, 18, 19};

byte numberLength(byte n) {
  return floor(log10(abs(n))) + 1;
}


// legal moves matrix x,y
// current piece in the air x,y
// current player turn
void initGameState() {
  //set pieces to starting positions in matrix
  //flash all leds to indicate game begin
  //set all leds to off
  //start eventLoop
}
void eventLoop() {
  // what piece has been moved?
  // has it been put down or up? call fun appropriately
  // TODO are all the pieces in starting position?
    //if so, call initGameState
}
void piecePutDown() {
  // does this spot correspond to a previous legal move?
    //if not, DON'T turn off existing green lights, red led on spot
    //if so,
      //flash green led on spot
      //then all leds off
      //change piece in matrix
}
void updateBoardAfterMove() {
  //is this a special move that requires special updating? (Promoting)
}
void piecePickedUp() {
  //if this isnt the first piece to be picked up
    //and an unmoved
    //otherwise red led on piece
  //which piece has been picked up?
  //if this the current's player figure?
    //if not, red led on piece
  //does this piece have legal moves?
    //if not, red led on piece
    //if so, green led all legal moves
}
void setMux() {}
void processLeds() {
  //for loop

}

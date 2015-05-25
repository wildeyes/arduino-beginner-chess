enum Piece {
  blackPawn = 1, blackKing = 2, blackQueen = 3, blackRook = 4, blackBishop = 5, blackKnight = 6, blackUnmovedRook = 7, blackUnmovedKing = 8,
  whitePawn = 9, whiteKing = 10, whiteQueen = 11, whiteRook = 12, whiteBishop = 13, whiteKnight = 14, whiteUnmovedRook = 15, whiteUnmovedKing = 16
};

enum Color {
  None = 0, Green = 1, Red = 2, Yellow = 3
}

// legal moves matrix x,y
// current piece in the air x,y
// current player turn
byte** initGameState() {
  //set pieces to starting positions in matrix
  statis byte board[8][8] = {
    {blackRook, blackKnight, blackBishop, blackQueen, blackKing, blackBishop, blackKnight, blackRook},
    {blackPawn, blackPawn, blackPawn, blackPawn, blackPawn, blackPawn, blackPawn, blackPawn},
    {0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0},
    {whitePawn, whitePawn, whitePawn, whitePawn, whitePawn, whitePawn, whitePawn, whitePawn},
    {whiteRook, whiteKnight, whiteBishop, whiteQueen, whiteKing, whiteBishop, whiteKnight, whiteRook}
  };
  //flash all leds to indicate game begin
  flashLeds(Green, 1500);
  //set all leds to off
  flashLeds(None, 0);
  //start eventLoop
  //TODO start it this way?
  startEventLoop = true;
}

void eventLoop() {
  // what piece has been moved?
  // has it been put down or up? call fun appropriately
  // TODO are all the pieces in starting position?
    //if so, call initGameState
  processLeds();
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

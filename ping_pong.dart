library ping_pong;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'board.dart';
part 'ball.dart';
part 'racket.dart';

// See the style guide: http://www.dartlang.org/articles/style-guide/.

// Spiral 12.

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = querySelector('#canvas');
  Board board = new Board(canvas);
}

class Board {
  final num START_X = 0;
  final num START_Y = 0;
  final num BALL_R = 10;
  final num RACKET_W = 75;
  final num RACKET_H = 10;
  final num INTERVAL = 10;

  Timer timer;

  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num width;
  num height;

  num dx = 2;
  num dy = 4;

  Ball ball;
  Racket racket;

  Board(CanvasElement this.canvas) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;
  }

  void init() {
    ball = new Ball(this, START_X, START_Y, BALL_R);
    racket = new Racket(this, width/2, height-RACKET_H, RACKET_W, RACKET_H);
    //call the function ball.move() every 10ms.
    timer = new Timer.repeating(INTERVAL, (t) => redraw());
  }

  void clear() {
    context.clearRect(0, 0, width, height);
  }

  void redraw() {
    clear();
    ball.draw();
    racket.draw();
    if (ball.x + dx > width || ball.x + dx < 0) {
      dx = -dx;
    }
    if (ball.y + dy > height || ball.y + dy < 0) {
      dy = -dy;
    } else if (ball.y + dy > height) {
      if (ball.x > racket.x && ball.x < racket.x + racket.w) {
        dy = -dy;
      } else {
        //game over, so stop the animation
        timer.cancel();
      }
    }
    ball.x += dx;
    ball.y += dy;
  }
}

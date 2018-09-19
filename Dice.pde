int diceSize;
void setup() {
  size(500, 500);
  background(255);
  noLoop();
  diceSize = 25;
}

void draw() {
  int sum = 0;
  for(int i=0;i<width/diceSize;i++) {
    for(int j=0;j<height/diceSize;j++) {
      Die dice = new Die(j*25, i*25, diceSize);
      dice.roll();
      sum += dice.getValue();
    }
  }
  println(sum);
}
void mousePressed() {
  redraw();
}

class Die {
  int x;
  int y;
  int dimension;
  int value = 0;
  Die(int x, int y, int diceDimension)  { // constructor
    this.x = x;
    this.y = y;
    this.dimension = diceDimension;
  }
  void roll() {
    value = (int)(Math.random()*6)+1;
    show();
  }
  void show() {
  	stroke(0);
  	fill((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    rect(x, y, dimension, dimension);
   	fill(255);
   	noStroke();
   	if(this.value == 1 || value == 5 || value == 3) {
      ellipse(x + dimension / 2, y + dimension / 2, dimension * 0.2, dimension * 0.2);
    }
    if(value == 2 || value == 3 || value == 4 || value == 5 || value == 6) {
      float padding = dimension * 0.2;
      ellipse(x + padding, y + padding, dimension * 0.2, dimension * 0.2);
      ellipse(x + dimension - padding, y + dimension - padding, dimension * 0.2, dimension * 0.2);
    }
    if(this.value == 4 || value == 5 || value == 6) {
      float padding = dimension * 0.2;
      ellipse(x + dimension - padding, y + padding, dimension * 0.2, dimension * 0.2);
      ellipse(x + padding, y + dimension - padding, dimension * 0.2, dimension * 0.2);
    }
    if(this.value == 6) {
      float padding = dimension * 0.2;
      ellipse(x + dimension / 2, y + padding, dimension * 0.2, dimension * 0.2);
      ellipse(x + dimension / 2, y + dimension - padding, dimension * 0.2, dimension * 0.2);
    }
  }
  int getValue() {
    return value;
  }
}
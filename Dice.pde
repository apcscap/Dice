int diceSize;
int sum = 0;
void setup() {
  size(500, 500);
  background(255);
  noLoop();
  noStroke();
  diceSize = 25;
}

void draw() {
  sum = 0;
  for(int i=0;i<width/diceSize;i++) {
    for(int j=0;j<height/diceSize;j++) {
      Die dice = new Die(j*25, i*25, diceSize);
      dice.roll();
      sum += dice.getValue();
    }
  }
  // println(sum);
}
// void mousePressed() {
//   redraw();
// }

class Die {
  int x;
  int y;
  int diceSize;
  int value = 0;
  Die(int x, int y, int diceSize)  { // constructor
    this.x = x;
    this.y = y;
    this.diceSize = diceSize;
  }
  void roll() {
    value = (int)(Math.random()*6)+1;
    show();
  }
  void show() {
  	fill((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    rect(x, y, diceSize, diceSize);
   	fill(255);
   	if(this.value == 1 || value == 5 || value == 3) {
      ellipse(x + diceSize / 2, y + diceSize / 2, diceSize * 0.2, diceSize * 0.2);
    }
    if(value == 2 || value == 3 || value == 4 || value == 5 || value == 6) {
      float padding = diceSize * 0.2;
      ellipse(x + padding, y + padding, diceSize * 0.2, diceSize * 0.2);
      ellipse(x + diceSize - padding, y + diceSize - padding, diceSize * 0.2, diceSize * 0.2);
    }
    if(this.value == 4 || value == 5 || value == 6) {
      float padding = diceSize * 0.2;
      ellipse(x + diceSize - padding, y + padding, diceSize * 0.2, diceSize * 0.2);
      ellipse(x + padding, y + diceSize - padding, diceSize * 0.2, diceSize * 0.2);
    }
    if(this.value == 6) {
      float padding = diceSize * 0.2;
      ellipse(x + diceSize / 2, y + padding, diceSize * 0.2, diceSize * 0.2);
      ellipse(x + diceSize / 2, y + diceSize - padding, diceSize * 0.2, diceSize * 0.2);
    }
  }
  int getValue() {
    return value;
  }
}

public int getTotal() {
	return sum;
}
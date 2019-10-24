PImage imgSemFundo = new PImage(320,240);

int detectaMovimento(float x, float y, float r ) {

  int total = 0;
  
  for (int i = int(x); i < int(x+r); i++) {
    for (int j = int(y); j < int(y+r); j++) {
      if ( comparaCor(imgSemFundo.get(i,j), color(0,0,0)) > 5 ) {  
        total = total + 1;
      }
    }
  }

  return total;
}

void subtraiFundo() {

  color corFundo;
  color corAtual;

  float dif = 0;

  for (int i = 0; i < 320; i++) {
    for (int j = 0; j < 240; j++) {
      corAtual = imagemAtual.get(i,j);
      corFundo = fundo.get(i,j);

      dif = comparaCor(corAtual, corFundo);

      if (dif > 40) {  
        imgSemFundo.set(i,j,corAtual);
      }
      else{ 
        imgSemFundo.set(i,j,color(0,0,0));
      }
    }  
  }
}


float comparaCor(color c1, color c2) {

  float r, g, b;

  r = abs(red(c1) - red(c2));
  g = abs(green(c1) - green(c2));
  b = abs(blue(c1) - blue(c2));

  return ( (r + g + b)/3.0 ); 

}

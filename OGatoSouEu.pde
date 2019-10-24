//bibliotecas
import processing.opengl.*;
import hypermedia.video.*;
import codeanticode.gsvideo.*;

import ddf.minim.*;
import java.awt.Rectangle;

Minim minim = new Minim(this);
AudioPlayer miau[]= new AudioPlayer[5];

PImage fundo;
PImage imagemAtual;

GSMovie video[] = new GSMovie[5];

PImage gato;

//definicoes
static int NUMERO_DE_MASCARAS = 5;          // numero maximo de mascaras
static int CAM_ID = 0;                      // define a camera


OpenCV opencv;

int offset = 2;    // offset do vetor de mascaras


/*****************
 
 ****************/
void setup() {

  size(960,720, OPENGL);
  smooth();
  
  fundo = new PImage(320,240);
  
  gato = loadImage("gato2.png");
  opencv = new OpenCV(this);
  opencv.capture( 320, 240, CAM_ID);
  opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // classificador de faces

  miau[0] = minim.loadFile("1.mp3",2048);
  miau[1] = minim.loadFile("2.mp3",2048);
}


/*****************
 * void draw() 
 ****************/
void draw() {

  int k;

  opencv.read();                        // le quadro atual na camera
  opencv.flip(OpenCV.FLIP_HORIZONTAL);  // inverte imagem
  
  imagemAtual = (opencv.image()).get();
  
  background(200);                       
  Rectangle[] faces = opencv.detect();    // detecta faces
  image(opencv.image(),0,0,width,height);  // aumenta imagem


  if (faces.length == 0 ) {
    miau[0].pause();
    miau[1].pause();
  }
  
  if (faces.length > 0 && random(100) < 10) {

    int miado;
    
    if (random(100) < 50) {
      miado = 0;
    }
    else {
      miado = 1;
    }
    
    if (!miau[miado].isPlaying()) {
      miau[miado].play(1);
    }

  }

  subtraiFundo();
  //image(imgSemFundo,0,0);  
  for (int i = 0; i<faces.length; i++) {         
    if (faces[i] == null) break; // evita ponteiros nulos     

    float escala = (faces[i].width)/80.0; // escala da mascara
    float centrox = (faces[i].x+faces[i].width/2)*(width/320); // centro x da mascara
    float centroy = (faces[i].y + faces[i].height/2)*(height/240); // centro y da mascara

    float bigodeDx = (faces[i].x + faces[i].width/2 + 60*escala); // centro x do bigode
    float bigodeDy = (faces[i].y + faces[i].height/2 + 2*escala); // centro y do bigode    

    float bigodeEx = (faces[i].x+faces[i].width/2 - 60*escala); // centro x do bigode
    float bigodeEy = (faces[i].y + faces[i].height/2 + 2*escala); // centro y do bigode    
    
    float ve = detectaMovimento(bigodeEx,bigodeEy, escala*40);
    float vd = detectaMovimento(bigodeDx,bigodeDy, escala*40);
    
    bigode( centrox, centroy, escala, ve+50, vd+50);   
    /*
    println(ve);
    image(imgSemFundo,0,0);  
    fill(255);
    ellipse(bigodeDx, bigodeDy, escala*40, escala*30);
    ellipse(bigodeEx, bigodeEy, escala*40, escala*30);
    */
  }          


  
  //image(fundo,0,0,width,height);
  //  image(mascaras[0];
}


void orelha(float x, float y, float t){
  pushMatrix();
  //rotate(-0.5);
  stroke(0);
  translate(x+10,y-20*t);
  scale(t);
  strokeWeight(5);

  line(-125,-150,-125,-100);
  line(-125,-150,-90,-120);

  pushMatrix();   
  scale(0.6);
  translate(-70,-70);
  line(-127,-145,-125,-105);
  line(-127,-145,-100,-125);
  popMatrix();
  
  stroke(0);  
  popMatrix();
}


void orelhaE(float x, float y, float t){
  pushMatrix();
  //rotate(-0.5);
  stroke(0);
  translate(x+200*t,y-20*t);
  scale(t);
  strokeWeight(5);

  line(-95,-150,-125,-115);
  line(-95,-150,-90,-100);

  pushMatrix();   
  scale(0.6);
  translate(-70,-70);
  line(-90,-145,-115,-125);
  line(-90,-145,-90,-105);
  popMatrix();
  
  stroke(0);  
  popMatrix();
}

void mouseReleased() {

  save(hour()+" "+minute()+" "+second()+".jpg"  );

}

void keyPressed() {
  if (key==ENTER) {
    fundo = (opencv.image()).get();
  }
}

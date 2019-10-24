void bigode(float x, float y ,float t, float ve, float vd ){
  stroke(0);
  noFill();
  pushMatrix();
  translate(x-t*gato.width/2,y-t*gato.height/2);
  scale(t);
  
   float dx, dy;  // ajuste do bigode esquerdo
   float dx2, dy2; // ajuste do bigode direito
   
   dx2 = 0;
   dy2 = -18;
   
   dx = 95;
   dy = -15;

  beginShape();
  curveVertex(300-dx2,300-dy2); // ponto de controle
  curveVertex(200-dx2,195-dy2);//começo da linha
  curveVertex(500-dx2,vd-dy2);//fiom da linha
  curveVertex(400-dx2,vd+100-dy2);
  endShape(); 


  beginShape();
  curveVertex(300-dx2,300-dy2); // ponto de controle
  curveVertex(200-dx2,200-dy2);//começo da linha
  curveVertex(500-dx2,vd+100-dy2);//fiom da linha
  curveVertex(300-dx2, vd+100-dy2);
  endShape(); 

  //bigode de cima------------------------------------------------------------------------------------
  beginShape();
  curveVertex(300-dx2,300-dy2); // ponto de controle
  curveVertex(200-dx2,190-dy2);//começo da linha
  curveVertex(500-dx2,vd-100-dy2);//fim da linha
  curveVertex(150-dx2, vd+200-dy2);//ponto de controle
  endShape(); 

  //-----------------------------------------------------------------------------------------------------------------------------------
  //bigode esquerdo
    //bigode do meio----------------------------------------------------------------------------------------------------------------------------------
    beginShape();
  curveVertex(400-dx,400-dy); // ponto de controle
  curveVertex(190-dx,195-dy);//começo da linha
  curveVertex(-100-dx,ve-dy);//fiom da linha
  curveVertex(50-dx, ve+100-dy);
  endShape(); 



  //bigode de cima------------------------------------------------------------------------------------------------------------------------------------- 

    beginShape();
  curveVertex(400-dx,400-dy); // ponto de controle
  curveVertex(190-dx,190-dy);//começo da linha
  curveVertex(-100-dx,ve-100-dy);//fiom da linha
  curveVertex(50-dx, ve+100-dy);
  endShape(); 



  // bigode de baixo-----------------------------------------------------------------------------------------------------------------------------------
    beginShape();
  curveVertex(400-dx,400-dy); // ponto de controle
  curveVertex(190-dx,200-dy);//começo da linha
  curveVertex(-100-dx,ve+100-dy);//fim da linha
  curveVertex(100-dx, ve+100-dy);//ponto de controle
  endShape(); 

  scale(1,1.1);
  image(gato,0,-40);

  popMatrix();
}

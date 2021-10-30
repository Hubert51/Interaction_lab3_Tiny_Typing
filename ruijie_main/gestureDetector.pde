boolean didMouseClick(float x, float y, float w, float h) //simple function to do hit testing
{
  return (mouseX > x && mouseX<x+w && mouseY>y && mouseY<y+h); //check to see if it is in button bounds
}

//void mouseDragged(){
//  j = int((mouseX-xul) / int(sizeOfInputArea/4));
//  i = int((mouseY-yul) / int(sizeOfInputArea/4));
//  if (i>0){
//    fill(200);
//    rect(xul+j*sizeOfInputArea/col, 
//       yul+i*sizeOfInputArea/row, 
//       sizeOfInputArea/col, 
//       sizeOfInputArea/row); //draw left red button
//  }
//}


void mouseReleased(){
  if (dragPressed){
    if (mouseY-dragY1>100){  // show next keyboard page
      currentLetter ++;  //?? TODO: @Ruijie verify this if needed
      dragPressed = false;
      currentPage = (currentPage-1+pageKeys.length) % pageKeys.length;
    }else if (mouseY-dragY1<-100){  // show prev keyboard page
      currentLetter ++;
      dragPressed = false;
      currentPage = (currentPage+1) % pageKeys.length;
    }else if(mouseX-dragX1>100){  // add space
      dragPressed = false;
      currentTyped += " ";
    }else if (mouseX-dragX1<-100){  // remove last input character
      dragPressed = false;
      currentTyped = currentTyped.substring(0, Math.max(0,currentTyped.length()-1));
    }else{
      if (mouseX>xul && mouseX<xul+sizeOfInputArea && mouseY>yul && mouseY<yul+sizeOfInputArea){
        int col_index = int((mouseX-xul) / int(sizeOfInputArea/col));
        int row_index = int((mouseY-yul) / int(sizeOfInputArea/row));
        if (row_index>0){
          // System.out.println("Pressed: "+str(row_index)+" "+str(col_index));
          currentTyped += pageKeys[currentPage][Math.max(row_index-1,0)*col+col_index];
        }else if (row_index == 0){
          currentTyped += autofillString;  //if tap textbox, apply autofill result
        }
      }
    }
  }
  pressedFlag = false;
}

//my terrible implementation you can entirely replace
void mousePressed()
{
  if (didMouseClick(width/2-sizeOfInputArea/2, 
                    height/2-sizeOfInputArea/2, 
                    sizeOfInputArea, 
                    sizeOfInputArea)) //check if click in left button
  {
    dragPressed = true;
    dragX1 = mouseX;
    dragY1 = mouseY;
  }
  
  pressedFlag = true;


  //if (didMouseClick(xul, yul+sizeOfInputArea/2, sizeOfInputArea/2, sizeOfInputArea/2)) //check if click in left button
  //{
  //  currentLetter --;
  //  if (currentLetter<'_') //wrap around to z
  //    currentLetter = 'z';
  //}

  //if (didMouseClick(xul+sizeOfInputArea/2, yul+sizeOfInputArea/2, sizeOfInputArea/2, sizeOfInputArea/2)) //check if click in right button
  //{
  //  currentLetter ++;
  //  if (currentLetter>'z') //wrap back to space (aka underscore)
  //    currentLetter = '_';
  //}

  //if (didMouseClick(xul, yul, sizeOfInputArea, sizeOfInputArea/2)) //check if click occured in letter area
  //{
  //  if (currentLetter=='_') //if underscore, consider that a space bar
  //    currentTyped+=" ";
  //  else if (currentLetter=='`' & currentTyped.length()>0) //if `, treat that as a delete command
  //    currentTyped = currentTyped.substring(0, currentTyped.length()-1);
  //  else if (currentLetter!='`') //if not any of the above cases, add the current letter to the typed string
  //    currentTyped+=currentLetter;
  //}

  //You are allowed to have a next button outside the 1" area
  if (didMouseClick(600, 600, 200, 200)) //check if click is in next button
  {
    nextTrial(); //if so, advance to next trial
  }
}

boolean didMouseClick(float x, float y, float w, float h) //simple function to do hit testing
{
  return (mouseX > x && mouseX<x+w && mouseY>y && mouseY<y+h); //check to see if it is in button bounds
}

void mouseReleased(){
  if (dragPressed){
    if (mouseY-dragY1>100){  // show next keyboard page
      currentLetter ++;  //?? TODO: @Ruijie verify this if needed
      dragPressed = false;
      currentPage = (currentPage-1+pageNum) % pageNum;
    }else if (mouseY-dragY1<-100){  // show prev keyboard page
      currentLetter ++;
      dragPressed = false;
      currentPage = (currentPage+1) % pageNum;
    }else if(mouseX-dragX1>100){  // add space
      //dragPressed = false;
      //currentTyped += " ";
    }else if (mouseX-dragX1<-100){  // remove last input character
      //dragPressed = false;
      //currentTyped = currentTyped.substring(0, Math.max(0,currentTyped.length()-1));
    }else{
      if (mouseX>xul && mouseX<xul+sizeOfInputArea && mouseY>yul && mouseY<yul+sizeOfInputArea){
        int col_index = int((mouseX-xul) / int(sizeOfInputArea/col));
        int row_index = int((mouseY-yul) / int(sizeOfInputArea/row));
        if (row_index>0){
          // System.out.println("Pressed: "+str(row_index)+" "+str(col_index));
          if (col_index == col-1 && row_index == 1){
            dragPressed = false;
            currentTyped = currentTyped.substring(0, Math.max(0,currentTyped.length()-1));          
          } else if (col_index == col-1 && row_index == 2) {
            dragPressed = false;
            currentTyped += " ";
          } else if (col_index == col-1 && row_index == 3) {
            currentTyped = currentTyped.substring(0, Math.max(currentTyped.lastIndexOf(' '),0));
          } 
          else {
            char tempChar = char('a' + currentPage*((row-1)*(col-1))+(row_index-1)*(col-1)+col_index + currentPage);
            
            currentTyped += tempChar;
          }
        }
        // do not need autofill text in version 1
        //else if (row_index == 0){
        //  currentTyped += autofillString;  //if tap textbox, apply autofill result
        //}
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
  
  if (finishTime!=0 && didMouseClick(600, 300, 200, 100)){
    /* Original vars from sample code */
    currTrialNum = 0; // the current trial number (indexes into trials array above)
    startTime = 0; // time starts when the first letter is entered
    finishTime = 0; // records the time of when the final trial ends
    lastTime = 0; //the timestamp of when the last trial was completed
    lettersEnteredTotal = 0; //a running total of the number of letters the user has entered (need this for final WPM computation)
    lettersExpectedTotal = 0; //a running total of the number of letters expected (correct phrases)
    errorsTotal = 0; //a running total of the number of errors (when hitting next)
    currentPhrase = ""; //the current target phrase
    currentTyped = ""; //what the user has typed so far
    lastWord = "";
  }

  //You are allowed to have a next button outside the 1" area
  if (didMouseClick(100, 300, 200, 200)) //check if click is in next button
  {
    nextTrial(); //if so, advance to next trial
  }
}

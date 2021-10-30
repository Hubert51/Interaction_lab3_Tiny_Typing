import java.util.Arrays;
import java.util.Collections;
import java.util.Random;

//You can modify anything in here. This is just a basic implementation.
void setup()
{
  //noCursor();
  watch = loadImage("watchhand3smaller.png");
  //finger = loadImage("pngeggSmaller.png"); //not using this
  phrases = loadStrings("phrases2.txt"); //load the phrase set into memory
  Collections.shuffle(Arrays.asList(phrases), new Random()); //randomize the order of the phrases with no seed
  //Collections.shuffle(Arrays.asList(phrases), new Random(100)); //randomize the order of the phrases with seed 100; same order every time, useful for testing
  orientation(LANDSCAPE); //can also be PORTRAIT - sets orientation on android device
  
  ////// ** For LG K31 ***
  size(1520, 720); //Sets the size of the app. You should modify this to your device's native size. Many phones today are 1080 wide by 1920 tall.
  DPIofYourDeviceScreen = 295;

  
  // *** For Pixel 5 ***
  // DPIofYourDeviceScreen = 432;
  sizeOfInputArea = DPIofYourDeviceScreen*1;
  // size(2340, 1080); //Sets the size of the app. You should modify this to your device's native size. Many phones today are 1080 wide by 1920 tall.

  
  //textFont(createFont("Arial", 20)); //set the font to arial 24. Creating fonts is expensive, so make difference sizes once in setup, not draw
  textFont(createFont("Segoe UI", 40)); //set the font to arial 24. Creating fonts is expensive, so make difference sizes once in setup, not draw
  noStroke(); //my code doesn't use any strokes
  xul = (width/2-sizeOfInputArea/2);
  yul = (height/2-sizeOfInputArea/2);
  row = 4;
  col = 4;
  //p1Keys = "ab*cd*ef*".toCharArray();
  //p2Keys = "ghijklmno".toCharArray();
  //p3Keys = "pqrstuvwx".toCharArray();
  //p4Keys = "yz       ".toCharArray();
  //pageKeys = new char[][] {p1Keys, p2Keys, p3Keys, p4Keys};
  p1Keys = "abc*def*ghi*".toCharArray();
  p2Keys = "jklmnopqrstu".toCharArray();
  p3Keys = "vwxyz       ".toCharArray();
  pageKeys = new char[][] {p1Keys, p2Keys, p3Keys};
}



//=========SHOULD NOT NEED TO TOUCH THIS METHOD AT ALL!==============
int computeLevenshteinDistance(String phrase1, String phrase2) //this computers error between two strings
{
  int[][] distance = new int[phrase1.length() + 1][phrase2.length() + 1];

  for (int i = 0; i <= phrase1.length(); i++)
    distance[i][0] = i;
  for (int j = 1; j <= phrase2.length(); j++)
    distance[0][j] = j;

  for (int i = 1; i <= phrase1.length(); i++)
    for (int j = 1; j <= phrase2.length(); j++)
      distance[i][j] = min(min(distance[i - 1][j] + 1, distance[i][j - 1] + 1), distance[i - 1][j - 1] + ((phrase1.charAt(i - 1) == phrase2.charAt(j - 1)) ? 0 : 1));

  return distance[phrase1.length()][phrase2.length()];
}

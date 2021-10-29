String[] phrases; //contains all of the phrases
int totalTrialNum = 2; //the total number of phrases to be tested - set this low for testing. Might be ~10 for the real bakeoff!
int currTrialNum = 0; // the current trial number (indexes into trials array above)
float startTime = 0; // time starts when the first letter is entered
float finishTime = 0; // records the time of when the final trial ends
float lastTime = 0; //the timestamp of when the last trial was completed
float lettersEnteredTotal = 0; //a running total of the number of letters the user has entered (need this for final WPM computation)
float lettersExpectedTotal = 0; //a running total of the number of letters expected (correct phrases)
float errorsTotal = 0; //a running total of the number of errors (when hitting next)
String currentPhrase = ""; //the current target phrase
String currentTyped = ""; //what the user has typed so far
boolean isPixel = true;
int DPIofYourDeviceScreen = 295; //you will need to look up the DPI or PPI of your device to make sure you get the right scale. Or play around with this value.
float sizeOfInputArea = DPIofYourDeviceScreen*1; //aka, 1.0 inches square!
PImage watch;
PImage finger;
float xul = 0;
float yul = 0;
int row = 0;  //num of rows
int col = 0;  //num of cols
int i, j;
char tempLetter;
Boolean dragPressed = false;
float dragY1, dragX1;
Boolean pressedFlag = false;

final int letterBoard = 10;
char currentLetter = 'a';

int currentPage = 0;  // current keyboard page
char[] p1Keys;
char[] p2Keys;
char[] p3Keys;
char[] p4Keys;
char[][] pageKeys;

int col_index;
int row_index;

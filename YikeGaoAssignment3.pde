PImage currentFrameImageBG, currentFrameImageFG;
PImage mos0, mos1, mos2, mos3, mos4;
int currentFrameNumBG=0;
int currentFrameNumFG=0;
String frameNameBG, frameNameFG;
String status;
char keychar ='0';
int numFramesBG = 572;//number of images in this video
int numFramesFG = 333;

void setup()
{
  size( 768, 432);
  frameRate(14);
  mos0 = loadImage("mos0.png");
  mos1 = loadImage("mos1.png");
  mos2 = loadImage("mos2.png");
  mos3 = loadImage("mos3.png");
  mos4 = loadImage("mos4.png");
  // argument is resulting pixel size
}

void loadNextImage()
{
  currentFrameNumBG++;
  currentFrameNumFG++;
  if (currentFrameNumFG>numFramesFG) {
    currentFrameNumFG =1;
  }
  if (currentFrameNumBG>numFramesBG) {
    currentFrameNumBG = 1;
  }
  frameNameFG = "images02/dance"+nf(currentFrameNumFG, 3)+".jpg";
  frameNameBG = "images01/boat"+nf(currentFrameNumBG, 3)+".jpg"; //generates the name of next frame image to load
  currentFrameImageFG = loadImage(frameNameFG);
  currentFrameImageBG = loadImage(frameNameBG);
}

void draw()
{
  loadNextImage();
  switch(keychar) {
  case '0':
    image(currentFrameImageBG, 0, 0);
    break;
  case '1':
    // PImage greyScale = greyscale(currentFrameImageFG);
    //currentFrameImageBG.filter(GRAY);


    PImage chromakey = chromakey(currentFrameImageFG, currentFrameImageBG);
    //for (int i=0; i<chromakey.width; i++)
    //  for (int j=0; j<chromakey.height; j++) {
    //    threshdrawp(i*5, j*5, errordiffuse(chromakey, i*5, j*5));
    //  }
    chromakey.filter(GRAY);
    image(chromakey, 0, 0);
     saveFrame("myVideoChromakey/myChromakey####.jpg");

    break;

  case '2':
    currentFrameImageBG.filter(GRAY);
    for (int i=0; i<currentFrameImageBG.width; i++)
      for (int j=0; j<currentFrameImageBG.height; j++) {
        threshdrawp(i*5, j*5, errordiffuse(currentFrameImageBG, i*5, j*5));
      }
  saveFrame("myVideoMosaic/myChromakey####.jpg");
    break;


  }
}



void keyPressed() {
  keychar = key;
}

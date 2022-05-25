PImage greyscale(PImage im) {
  PImage im_new = im.copy();
  float R, G, B;
  color c, c_new;
  colorMode(RGB,255);
  for (int x=0; x<im.width; x++)
    for (int y=0; y<im.height; y++)
    {
      c = im.get(x, y);
      R = red(c);
      G = green(c);
      B = blue(c);
      c_new = color ((R+G+B)/3);
      im_new.set (x, y, c_new);
    }
  return im_new;
}
//thresholding and error diffusion bit
int errordiffuse(PImage img,  int x, int y )
{
  float v0 = 50;
  float v1 = 100;
  float v2 = 150;
  float v3 = 200;
  
  float v = red (img.get(x, y));
  
  float err;
 int lev;
  
  if (v<v0)
  {
    err = v;
    lev = 4;
  } 
  else if (v<v1)
  { 
    err = v-v0;
    lev = 3;
  }  
  else if (v<v2)
  {
    err = v-v1;
    lev = 2;
  } else  if (v<v3)
  {
    err = v-v2;
    lev = 1;
  }  else
  {
    err = v-v3;
    lev = 0;
  }
  
   img.set(x+1, y,   color ( red(img.get(x+1, y)) + 0.4375*err)  );
   img.set(x-1, y+1,   color ( red(img.get(x-1, y+1)) + 0.1875*err)  );
   img.set(x, y+1,   color ( red(img.get(x, y+1)) + 0.3125*err)  );
   img.set(x+1, y+1,   color ( red(img.get(x+1, y+1)) + 0.0625*err)  );
    
    return lev;
      
}




//based on the thresholded intensity value, chose an appropriate tile
void threshdrawp(int x, int y, int l)
{
  if (l==4)
  {
    image(mos0, x, y);
  }
  if (l==3)
  {
    image(mos1, x, y);
  }
  if (l==2)
  {
    image(mos2, x, y);
  }
  if (l==1)
  {
    image(mos3, x, y);
  }
  if (l==0)
  {
    image(mos4, x, y);
  }
  
}

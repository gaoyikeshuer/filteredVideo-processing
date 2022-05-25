PImage chromakey(PImage fg, PImage bg) {
  bg.resize(fg.width, fg.height);
  PImage output = fg.copy();
  
color target = color(0, 255, 0);

  for (int x=0; x < fg.width; x++)
    for (int y=0; y < fg.height; y++)
    {
      color fg_pixel = fg.get (x, y);
      color bg_pixel = bg.get (x, y);
      float diff = abs ( hue(target) - hue (fg_pixel) );
      if (diff < 20)
        output.set (x, y, bg_pixel);
      else
        output.set (x, y, fg_pixel);
    }
  return output;
}

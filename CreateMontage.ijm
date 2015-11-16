//get the path from user input
dir = getDirectory("Choose a Directory");

//Delete any existing montages
File.delete(dir+File.separator+"Montage.tif")

//Get number of images
list = getFileList(dir);
files = list.length
rows = files/4

//Montage, 4 columns, images/4 rows, scaled to 50% quality
run("Image Sequence...", "open=[dir] number=files starting=1 increment=1 scale=100 file=.tif or=[] convert_to_rgb sort use");
run("Make Montage...", "columns=4 rows=rows scale=0.50 first=1 last=88 increment=1 border=0 font=12 label use");
saveAs("Tiff", dir+File.separator+"Montage.tif");

//Close open images
      while (nImages>0) { 
          selectImage(nImages); 
          close(); 
      } 

// "Images2Stacks
// Self-written, improve later

macro "Images2Stacks"{

//get the path from user input
dir = getDirectory("Choose a Directory");
//create a new directory for the processed images
File.makeDirectory(dir + "\\Maximum\\");
File.makeDirectory(dir + "\\Stacks\\");

list = getFileList(dir);
//clean up the file list
dirList = newArray();
fileList = newArray();
sufName = getString("Filename ends with:", ".tif");

for(i=0; i<=list.length-1; i++){
if (endsWith(list[i], "/"))
dirList = Array.concat(dirList, list[i]);
else if (endsWith(list[i], sufName))
fileList = Array.concat(fileList, list[i]);
}

Array.print(fileList);

print ("start");
for(i=1; i<=500; i++){
	if (i < 10)
		string = "0" + i;
	else if (i>= 10)
		string =  "" + i;
stack = string + "_";
stack = "S" + stack;

run("Image Sequence...", "open=&dir \\[] starting=1 increment=1 scale=100 file=&stack sort");
Name = getInfo("slice.label");
Name = replace(Name, "_z00", "");
Name = replace(Name, "_z0", "");

run("Z Project...", "start=[] stop=[] projection=[Max Intensity]");

run("Save", "save=[" + dir+ "\\Maximum\\" + Name + ".tif]");
run("Split Channels");
selectWindow(Name + ".tif (blue)");
run("Save", "save=[" + dir+ "\\Maximum\\" +Name +"(blue).tif]");
close();
selectWindow(Name + ".tif (green)");
run("Save", "save=[" + dir+ "\\Maximum\\" + Name  + "(green).tif]");
close();
selectWindow(Name + ".tif (red)");
run("Save", "save=[" + dir+ "\\Maximum\\" + Name + "(red).tif]");
close();
close();
run("Image Sequence...", "open=&dir \\[] starting=1 increment=1 scale=100 file=&stack sort");
run("Save", "save=[" + dir+ "\\Stacks\\" + Name + ".tif]");
run("Split Channels");
selectWindow(Name + ".tif (blue)");
run("Save", "save=[" + dir+ "\\Stacks\\" + Name + "(blue).tif]");
close();
selectWindow(Name + ".tif (green)");
run("Save", "save=[" + dir+ "\\Stacks\\" + Name + "(green).tif]");
close();
selectWindow(Name + ".tif (red)");
run("Save", "save=[" + dir+ "\\Stacks\\" + Name + "(red).tif]");
close();
}
}

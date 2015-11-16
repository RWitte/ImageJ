Dialog.create("Enter Magnification");
Dialog.addString("Magnification",0);
Dialog.show;
magnification=Dialog.getString();
magnification=252.04/magnification;
run("Set Scale...", "distance=512 known=magnification pixel=1 unit=um");
run("Scale Bar...", "width=10 height=4 font=14 color=White background=None location=[Lower Left] bold hide");

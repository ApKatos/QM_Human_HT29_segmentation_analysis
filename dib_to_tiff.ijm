// Input and output directories
inputDir = "C:\\Users\\patri\\Downloads\\QM_project_data\\BBBC018_v1_images\\BBBC018_v1_images\\";
outputDir = "C:\\Users\\patri\\Downloads\\QM_project_data\\BBBC018_v1_images\\BBBC018_v1_images_tiff_test\\";

// Get the list of all files in the input directory
list = getFileList(inputDir);


// Loop through all files in the input directory
for (i = 0; i < list.length; i++) {
    // Only process .dib files
    if (endsWith(list[i], ".DIB")) {
        inputFilePath = inputDir + list[i];
        run("Bio-Formats Importer", "open=[" + inputFilePath + "] autoscale color_mode=Default view=Hyperstack stack_order=XYCZT");
		outputFileName = replaceExtension(list[i], ".tiff");
        outputFilePath = outputDir + outputFileName;
        saveAs("Tiff", outputFilePath);
        close();
    }
}

function replaceExtension(filename, newExtension) {
    dotIndex = lastIndexOf(filename, ".");
    if (dotIndex != -1) {
        return substring(filename, 0, dotIndex) + newExtension;
    } else {
        return filename + newExtension;
    }
}

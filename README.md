
# AL Large File Uploader Addin

Offer upload of **larger file than build-in 350 MB limit**, using Javascript addin.
Javacript addin is used to send chunks of file data to the page AL backend, who write each received chunk back into an Outstream.

With this method the **maximum size is 2 GB**, this is the maximum supported In-Out Stream size in AL.

Unfortunatly this method is **much slower than build-tin UploadIntoStream() function**.
The reason is that OutStream.Write() function is very slow when running on large Text variable, and I did not find another way to pass the data with limited JS to AL interop capability.

## **JS Addin**

![enter image description here](https://github.com/MaximeCaty/AL-LargeFile-Uploader-Addin/blob/main/screenshot.png?raw=true)

You may put the addin files (upload.css, upload.js, TOOChunkedFileUploader.ControlAddin.al) in your project under an Addin subfolder. They must be located in the same folder.


## Usage

The page (TOOUploadFileJS.Page.al) can be used as a Modal form and show the upload Addin with some information about progression.

To show the dialog and gather the uploaded stream, you can use it as following :

	var
		UploadJS: Page  "TOO Upload File JS";
		InStr: InStream;
	begin
		// Show Upload dialog
		UploadJS.LookupMode(true);
		if  not (UploadJS.RunModal() in [Action::LookupOK, Action::OK]) then
			exit; // User did not press OK
		
		// Handle the uploaded file
		if UploadJS.IsUploadCompleted() then begin
			UploadJS.GetInStream(ImportedfileName, InStr);
			Message('Uploaded file : %1, size : %2', ImportedfileName, InStr.Length);
		end;
	

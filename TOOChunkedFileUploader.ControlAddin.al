controladdin "TOO ChunkedFileUploader"
{
    MinimumHeight = 180;
    MinimumWidth = 380;
    RequestedHeight = 180;
    RequestedWidth = 380;
    StartupScript = 'uploader.js';
    StyleSheets = 'uploader.css';

    // JS triggers
    event StartUpload(FileName: Text; TotalSize: Integer);
    event UploadChunk(BinaryTextChunk: Text; ChunkNumber: Integer);
    event FinishUpload();
    event UploadError(ErrorMessage: Text);

}

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class FilePickerService {
  File? selectedImage;
  static final _imagePicker = ImagePicker();

  static Future<File?> pickImage() async {
    return pickImageWithCompression();
  }

  // static Future<List<File>> pickMedia({bool allowMultiple = true}) async {
  //   List<File> selectedFiles = [];
  //   final imagePicker = ImagePicker.platform;
  //   List<XFile> result = await imagePicker.getMedia(
  //     options: MediaOptions(
  //       imageOptions:  ImagePicker.,
  //       allowMultiple: allowMultiple,
  //     ),
  //   );

  //   if (result.isNotEmpty) {
  //     for (var xFile in result) {
  //       selectedFiles.add(File(xFile.path));
  //     }
  //   }
  //   return selectedFiles;
  // }

  static Future<File?> pickImageFromCamera() async {
    File? selectedImage;
    final image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) selectedImage = File(image.path);
    return selectedImage;
  }

  //Pick Video From Gallery
  static Future<File?> pickVideoFromGallery() async {
    File? selectedVideo;
    final video = await _imagePicker.pickVideo(source: ImageSource.gallery);
    if (video != null) selectedVideo = File(video.path);
    return selectedVideo;
  }

  ///picks an image from gallery and returns a compressed [File]
  static Future<File?> pickImageWithCompression({int imageQuality = 50}) async {
    File? selectedImage;
    final image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: imageQuality,
    );
    if (image != null) selectedImage = File(image.path);

    debugLog.d(
      '@pickImageWithCompression: Image Size: ${await image?.length()}',
    );
    return selectedImage;
  }

  static Future<List<File>> pickMultipleImages() async {
    List<File> selectedImages = [];
    final images = await _imagePicker.pickMultiImage();
    if (images.isNotEmpty) {
      for (var image in images) {
        selectedImages.add(File(image.path));
      }
    }
    return selectedImages;
  }

  // ///picks an image from gallery and returns a [File] without compression
  // static Future<File?> pickImageWithoutCompression() async {
  //   File? selectedImage;
  //   final filePicker = FilePicker.platform;
  //   FilePickerResult? result = await filePicker.pickFiles(
  //     type: FileType.image,
  //     allowMultiple: false,
  //   );

  //   if (result != null) {
  //     selectedImage = File(result.paths.first!);
  //     final extension = p.extension(selectedImage.path);
  //     log.d('@FilePickerService.pickImage ==> Extension: $extension');
  //     // if (extension == '.heic') {
  //     //   String? jpegPath = await HeicToJpg.convert(selectedImage.path);
  //     //   if (jpegPath != null) selectedImage = File(jpegPath);
  //     // }
  //   }
  //   return selectedImage;
  // }

  // /// Downloads a file from the given [url] and returns a [File]
  static Future<File> downloadFile(String url, String filename) async {
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = "";

    dir = (await getTemporaryDirectory()).path;

    File file = File('$dir/$filename');
    await file.writeAsBytes(bytes, mode: FileMode.write);

    return file;
  }

  // Private method
  static Future<File?> _pickImageAndCrop({
    required Future<File?> Function(File file)? cropImage,
  }) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile == null) return null;

    if (cropImage == null) {
      return File(pickedFile.path);
    } else {
      final file = File(pickedFile.path);
      return cropImage(file);
    }
  }

  /// Picks an image from gallery and returns a [File] after cropping.
  /// [isCircle] is used to crop the image in circle shape.
  /// [height] is the height os the cropping area.
  /// Add the following to AndroidManifest.xml:
  /// <activity
  ///  android:name="com.yalantis.ucrop.UCropActivity"
  ///  android:screenOrientation="portrait"
  ///  android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
  static Future<File?> selectAndCropImage({
    bool isCircle = true,
    double height = 1.4,
  }) async {
    File? file = await _pickImageAndCrop(
      cropImage: (File ss) {
        return _onShowcaseImageCrop(ss, isCircle, height);
      },
    );

    return file;
  }

  // Private method
  static Future<File?> _onShowcaseImageCrop(
    File file,
    bool isCircle,
    double height,
  ) async {
    var croppedImage = await ImageCropper().cropImage(
      sourcePath: file.path,

      compressQuality: 15,
      //aspectRatio: CropAspectRatio(ratioX: 2, ratioY: isCircle ? 2 : height),
      //aspectRatioPresets: [CropAspectRatioPreset.original],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: AppColors.brand,
          toolbarWidgetColor: AppColors.successColor,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          cropStyle: isCircle ? CropStyle.circle : CropStyle.rectangle,
        ),
        IOSUiSettings(
          title: 'Cropper',
          cropStyle: isCircle ? CropStyle.circle : CropStyle.rectangle,
          aspectRatioLockEnabled: false,
        ),
      ],
    );

    if (croppedImage != null) {
      return File(croppedImage.path);
    } else {
      return null;
    }
  }

  /// Generates a thumbnail from the given [videoPath] and returns a [File]
  // static Future<File?> generateThumbnail(String videoPath,
  //     [bool isUrl = false]) async {
  //   try {
  //     var tempPath = (await getTemporaryDirectory()).path;

  //     final xFile = await VideoThumbnail.thumbnailFile(
  //       video: videoPath,
  //       thumbnailPath: tempPath,
  //       imageFormat: isUrl ? ImageFormat.WEBP : ImageFormat.JPEG,
  //       maxHeight: 200,
  //       quality: 75,
  //     );

  //     print('Thumbnail Path: ${xFile.path}');
  //     return File(xFile.path);
  //   } catch (e) {
  //     print('Error: $e');
  //     return null;
  //   }
  // }

  // static Future<File?> generateThumbnail(
  //   String videoPath, [
  //   bool isUrl = false,
  // ]) async {
  //   try {
  //     var tempPath = (await getTemporaryDirectory()).path;

  //     final xFile = await VideoThumbnail.thumbnailFile(
  //       video: videoPath,
  //       thumbnailPath: tempPath,
  //       imageFormat: isUrl ? ImageFormat.WEBP : ImageFormat.JPEG,
  //       maxHeight: 200,
  //       quality: 75,
  //     );

  //     print('Thumbnail Path: ${xFile.path}');
  //     return File(xFile.path);
  //   } catch (e) {
  //     print('Error: $e');
  //     return null;
  //   }
  // }

  // static Future<File?> pickFile({
  //   FileType? fileType,
  //   List<String>? allowedExtensions,
  // }) async {
  //   File? selectedFile;
  //   final filePicker = FilePicker.platform;
  //   FilePickerResult? result = await filePicker.pickFiles(
  //     type: fileType ?? FileType.any,
  //     allowedExtensions: allowedExtensions,
  //     allowMultiple: false,
  //   );

  //   if (result != null) {
  //     selectedFile = File(result.paths.first!);
  //     log.d(
  //       '@pickFile: File Size: ${await selectedFile.length()}, File Path: ${selectedFile.path}, File Extension: ${p.extension(selectedFile.path)}',
  //     );
  //   }
  //   return selectedFile;
  // }

  ///
  ///

  static Future<File> getResourcePath(String resource) async {
    const filename = 'data.fi';
    var bytes = await rootBundle.load(resource);

    String dir = "";
    if (Platform.isIOS) {
      dir = (await getApplicationDocumentsDirectory()).path;
    } else {
      Directory? dd = await getExternalStorageDirectory();
      dir = dd!.path;
    }

    final path = '$dir/$filename';

    final buffer = bytes.buffer;
    await File(path).writeAsBytes(
      buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes),
    );

    File file = File('$dir/$filename');

    return file;
  }

  static String extractExtension(String url) {
    // Parse the URL using the Uri class
    try {
      Uri uri = Uri.parse(url);

      // Get the file extension from the path
      String extension = uri.pathSegments.last.split('.').last;

      return extension.isNotEmpty ? extension : 'mov';
    } catch (e) {
      return 'mov';
    }
  }

  static Future<File> downloadFileFromFirebase(
    String fileName,
    String firebaseUrl,
    void Function(TaskSnapshot)? onData,
  ) async {
    final extension = extractExtension(firebaseUrl);
    print('Link:$firebaseUrl');
    print(extension);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.refFromURL(firebaseUrl);
    var dir = await getApplicationDocumentsDirectory();
    File file = File('${dir.path}/$fileName.$extension');
    final DownloadTask task = ref.writeToFile(file);

    task.snapshotEvents.listen(onData);

    await task;

    return file;
  }
}

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:geolocation/router.router.dart';
import 'package:shared_preferences/shared_preferences.dart';

getHeight(context) => (MediaQuery.of(context).size.height);
getWidth(context) => (MediaQuery.of(context).size.width);
const kAadharpdf = "AadharCard";
String baseurl = geturl().toString();
String apiaddvisitorattendence = '$baseurl/api/resource/Visitor Attendance';
String apiaddtlcgiftinfo = '$baseurl/api/resource/TLC Gift Information';
String apiaddvisitor = '$baseurl/api/resource/Visitor Information';
String apiaddDesignation = '$baseurl/api/resource/Designation?limit_page_length=999';
String apiaddevent='$baseurl/api/resource/Events?fields=["name"]';
String apiroleprofile =
    '$baseurl/api/resource/Role Profile?filters=[["name","in",["Visitor Administrator","web user"]]]';
String apimember = '$baseurl/api/resource/Add Team Member';
String apievent = '$baseurl/api/resource/Events';
String apilistmember =
    '$baseurl/api/resource/Add Team Member?fields=["first_name","last_name","designation","company","name"]';
String apiUploadFilePost = '$baseurl/api/method/upload_file';
String productList =
    '$baseurl/api/resource/Product?fields=["product_name","name","product_image","description"]';

///functions
Future<String> getTocken() async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String? api_secret = prefs.getString("api_secret") ?? "";
  String? api_key = prefs.getString("api_key") ?? "";
  String formattedString = 'token $api_key:$api_secret';
  return formattedString;
}
Future<String> getSession() async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String? api_secret = prefs.getString("api_secret") ?? "";
  String? api_key = prefs.getString("api_key") ?? "";
  String formattedString = 'token $api_key:$api_secret';
  return formattedString;
}


Future<String> getUser() async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String? user = prefs.getString("user") ?? "";
  return user;
}

Future<String> geturl() async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String? url = prefs.getString("url") ?? "";
  return url;
}

Future<String> getEmpId() async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String? employee_id = prefs.getString("employee_id") ?? "";
  return employee_id;
}

Future<String> getname() async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String? full_name = prefs.getString("full_name") ?? "";
  return full_name;
}

Future<String> getevent() async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String? event = prefs.getString("event") ?? "";
  return event;
}

void logout(BuildContext context) async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  prefs.clear();
  if (context.mounted) {
    Navigator.popAndPushNamed(context, Routes.loginViewScreen);
  }
}

String generateUniqueFileName(File file) {
  // Get the original file name and extension
  String originalFileName = file.path.split('/').last;
  String extension = originalFileName.split('.').last;

  // Generate a unique identifier (You can use any method you prefer)
  String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();

  // Combine the unique identifier with the original extension
  String uniqueFileName = '$uniqueId.$extension';

  return uniqueFileName;
}

bool isImage(File file) {
  List<String> imageExtensions = ['.png', '.jpg', '.jpeg', '.gif', '.bmp','.pdf','.doc'];
  String extension = file.path.split('.').last.toLowerCase();
  return imageExtensions.contains(extension);
}

bool isPDF(File file) {
  String extension = file.path.split('.').last.toLowerCase();
  return extension == '.pdf';
}

Future<File?> compressFile(File file) async {
  // Get the file path.
  final filePath = file.path;

  // Get the file extension.
  final fileExtension = filePath.split('.').last;

  // Create a new file name with the extension "_compressed".
  final compressedFileName =
      filePath.replaceAll(fileExtension, '_compressed.$fileExtension');

  var result = await FlutterImageCompress.compressAndGetFile(
    file.path,
    compressedFileName,
    quality: 60,
    // rotate: 180,
  );

  return fileFromXFile(result ?? XFile(""));
}

// Convert an XFile object to a File object.
File fileFromXFile(XFile xfile) {
  // Get the file path.
  final filePath = xfile.path;

  // Create a File object.
  final file = File(filePath);

  return file;
}

import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:http/http.dart' as http;
import '../../../../Constants/constants.dart';

class MyImageViewer extends StatelessWidget {
  MyImageViewer({Key? key, required this.fileUrl}) : super(key: key);
  String fileUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Image Viewer',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          GestureDetector(
            onTap: ()async{
              String? filetype = await getFileTypeFromUrl(fileUrl);
              // print(filetype);
              downloadFile(DateTime.now().millisecondsSinceEpoch, fileUrl,
                  DateTime.now().millisecondsSinceEpoch.toString() + '.$filetype');

            },
            child: const Icon(Icons.download_for_offline_sharp,color: Colors.black,size: 30,),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        backgroundColor: kwhitecolor,
      ),
      body: PhotoView(imageProvider: NetworkImage(fileUrl)),
    );
  }
}


Future<String?> getFileTypeFromUrl(String url) async {
  try {
    final response = await http.head(Uri.parse(url));
    if (response.statusCode == 200) {
      String? contentType = response.headers['content-type'];
      if (contentType != null) {
        return contentType.split('/').last;
      }
    }
  } catch (e) {
    // print("Error getting file type: $e");
  }
  return null;
}



Future<void> downloadFile(id, String url, String fileName) async {

  final saveDir = '/storage/emulated/0/Download';
  final savePath = '$saveDir/$fileName';

  final dio = Dio();

  try {
    // Request permission to access storage if not granted
    if (!await Permission.storage.isGranted) {
      await Permission.storage.request();
    }

    // Create the save directory if it doesn't exist
    final saveDirExists = await Directory(saveDir).exists();
    if (!saveDirExists) {
      await Directory(saveDir).create(recursive: true);
    }

    // Download the file
    await dio.download(url, savePath, onReceiveProgress: (receivedBytes, totalBytes) {
      final progress = (receivedBytes / totalBytes * 100).toStringAsFixed(0);
      // print('Download progress: $progress%');
    }).then((value) => print(value));

    // print('File downloaded successfully!');
    Fluttertoast.showToast(msg: '${fileName} downloaded successfully');
    showNotification('File saved at: $savePath');

    //scheduleNotification(id, fileName, savePath);

    // print('File saved at: $savePath');
  } catch (e) {
    Fluttertoast.showToast(msg: 'File Not found');
    // print('Error downloading file: $e');
  }
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> scheduleNotification(id, fileName, path) async {
  var scheduledNotificationDateTime = DateTime.now().add(const Duration(seconds: 1));
  Future<void> scheduleNotification(id, fileName, path) async {
    var scheduledNotificationDateTime = DateTime.now().add(const Duration(seconds: 1));
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.schedule(
      id,
      '$fileName downloaded successfully',
      'path: $path',
      scheduledNotificationDateTime,
      platformChannelSpecifics,
      payload: 'Notification payload',
    );
  }
}

showNotification(message) async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  var android = const AndroidInitializationSettings('@mipmap/ic_launcher');
  var intitial = InitializationSettings(android: android);
  await flutterLocalNotificationsPlugin.initialize(intitial, onDidReceiveNotificationResponse: (payload) {});

  var channel = AndroidNotificationChannel(
    Random.secure().nextInt(100000).toString(),
    'high notification',
    importance: Importance.max,
  );

  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    channel.id.toString(),
    channel.name.toString(),
    importance: Importance.max,
    priority: Priority.high,
  );

  await flutterLocalNotificationsPlugin
      .show(
      1,
      'Downloaded Successfully',
      message,
      NotificationDetails(
        android: androidPlatformChannelSpecifics,
      ))
      .onError((error, stackTrace) => print("error:$error \nstack:$stackTrace"));
}

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Constants/constants.dart';
import '../../../widgets/appbar.dart';
import 'myimageviewer.dart';

class MyPdfViewer extends StatelessWidget {
  MyPdfViewer({Key? key, required this.fileUrl}) : super(key: key);
  String fileUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'PDF Viewer',
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
      body: const PDF(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
      ).cachedFromUrl(
        fileUrl,
        placeholder: (progress) => Center(child: Text('$progress %')),
        errorWidget: (error) => Center(child: Text(error.toString())),
      ),
    );
  }
}

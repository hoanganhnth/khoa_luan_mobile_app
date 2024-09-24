import 'package:app_flutter/share/base_component/webview/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class WebviewScreen extends StatelessWidget {
  const WebviewScreen({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: SfPdfViewer.network("https://res.cloudinary.com/djnfk8j8v/image/upload/v1727198229/cv/epyfv1dxmminvtzyrscv.pdf")
         //WebViewWidget(url: url)
         )
        ;
  }
}

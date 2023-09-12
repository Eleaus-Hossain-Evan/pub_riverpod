import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/core.dart';
import 'features/parcel/presentation/parcel_list_screen.dart';

void main() {
  Logger.init(
    true,
    isShowFile: false,
    isShowTime: false,
  );
  NetworkHandler.instance
    ..setup(baseUrl: APIRoute.BASE_URL, showLogs: false)
    ..setToken(
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Il9pZCI6IjY0ZjA0ZmY1YThlMDlmNDMxNDQ4YTQ1ZCIsIm5hbWUiOiJhbHZpIiwicGhvbmUiOiIwMTkzOTQxODg5MSIsImVtYWlsIjoieHl6QGdtYWlsLmNvbSIsImh1YklkIjoiNjRlZjFkN2FiMDFjNDIxZDc5YzkwNGE1IiwiaHViTmFtZSI6IlRlc3QgMSBIdWIiLCJyb2xlIjoibWVyY2hhbnQifSwiaWF0IjoxNjk0NDM2ODAxLCJleHAiOjE2OTUwNDE2MDF9.lbWh5snmVHdSqrRWcO4dWI-azyq4oPAUnYwIiI2_yY8');
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        home: const ParcelListScreen(),
        builder: BotToastInit(),
      ),
    );
  }
}

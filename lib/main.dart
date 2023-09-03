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
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Il9pZCI6IjY0ZjAxMmMzMTdlODY5MjNhNDVlNWMwYyIsIm5hbWUiOiJNZXJjaGFudC1PbGQgRGhha2EiLCJwaG9uZSI6IjAxMzAyOTM2NTkzIiwiZW1haWwiOiJvbGRkaGFrYUBtZXJjaGFudC5jb20iLCJodWJJZCI6IjY0ZjAxMTZkMTdlODY5MjNhNDVlNWJlNSIsImh1Yk5hbWUiOiJTYWRhcmdoYXQgSHViICIsInJvbGUiOiJtZXJjaGFudCJ9LCJpYXQiOjE2OTM3NDIzOTIsImV4cCI6MTY5NDM0NzE5Mn0.vh_55doNNe0MluCBjXoDTHIZGr4BYExlS13huN2rjPg');
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

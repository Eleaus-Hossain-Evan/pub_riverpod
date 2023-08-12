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
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Il9pZCI6IjY0YjhmY2EwZjIwZGQwOTU2ZTliNTg0MyIsIm5hbWUiOiJLaCBOaXNoYWQiLCJwaG9uZSI6IjAxNzI4ODk3MjY0IiwiZW1haWwiOiJhYmRzYXR0YXI4NkBnbWFpbC5jb20iLCJodWJJZCI6IjY0YWQxN2EzNDVlMzg5MmUzNDIyNWE1OCIsImh1Yk5hbWUiOiJuaWt1bmphIiwicm9sZSI6Im1lcmNoYW50In0sImlhdCI6MTY5MTg2Mzc3MSwiZXhwIjoxNzIzMzk5NzcxfQ.0JzPRWjaI3eN4eHzdiDZF59eoIqIWZ_VJ65egudQQzE');
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

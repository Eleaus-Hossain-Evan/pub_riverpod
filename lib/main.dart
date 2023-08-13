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
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Il9pZCI6IjY0YzRkMjcxY2VjNWIzNjU3ODViODk4OSIsIm5hbWUiOiJmb3JoYWQiLCJwaG9uZSI6IjAxNzI4ODk3MjU1IiwiZW1haWwiOiJhYmRAZ21haWwuY29tIiwiaHViSWQiOiI2NGI2Nzg5ZTc0MjhjNjI5MWFjOTlhZDkiLCJodWJOYW1lIjoiS2ggTmlzaGFkIiwicm9sZSI6Im1lcmNoYW50In0sImlhdCI6MTY5MTM4ODY0NywiZXhwIjoxNzIyOTI0NjQ3fQ.9LIM95ZRy-1PQcC9yA6D9fGmC5U-BDPWR1LDw2ljafk');
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ir_project/app/core/theme/app_theme.dart';
import 'package:ir_project/app/core/utils/constants/constants.dart';

import 'app/routes/app_pages.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (ctx, child) {
          return GetMaterialApp(
            title: "MediZone Doctor",
            theme: AppTheme.getInstance().getAppTheme(AppLanguageKeys.en),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              //add this line
              ScreenUtil.init(context);
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            supportedLocales: const [
              Locale('en', ''),
            ],
            locale: const Locale('en'),
            initialBinding: BindingsBuilder(() => {
                }),
          );
        });
  }
}

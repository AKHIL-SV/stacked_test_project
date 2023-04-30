import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_test_project/utilities/size_config.dart';
import 'package:stacked_test_project/view/home/home_view.dart';
import 'package:stacked_test_project/view/setup/setup_bottom_sheet_ui.dart';
import 'package:stacked_test_project/view/setup/setup_dialog_ui.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'view/setup/setup_snackbar_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupSnackbarUi();
  setupBottomSheetUi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData.dark(),
            navigatorKey: StackedService.navigatorKey,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            home: const HomeView(),
          );
        },
      ),
    );
  }
}

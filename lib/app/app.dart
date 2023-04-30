import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_test_project/api/api_rep_impl.dart';
import 'package:stacked_test_project/repository/api_repository.dart';
import 'package:stacked_test_project/view/home/home_view.dart';
import 'package:stacked_test_project/view/account/account_view.dart';
import 'package:stacked_test_project/view/profile/profile_view.dart';
import '../api/api_client/apiclient.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    CustomRoute(
      page: AccountView,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
      page: ProfileView,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
  ],
  dependencies: [
    Singleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: ApiImpl, asType: ApiRepository),
    LazySingleton(classType: ApiClient, resolveUsing: ApiClient.create),
  ],
)
class AppSetup {}

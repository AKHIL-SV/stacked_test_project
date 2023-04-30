import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_test_project/app/app.locator.dart';
import 'package:stacked_test_project/app/app.router.dart';

import '../../enum/bottomsheet_type.dart';

class ProfileViewmodel extends BaseViewModel {
  final _navService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  navToAccountview() {
    _navService.navigateToAccountView();
  }

  showBottomSheet() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.floatingBox,
      title: 'Payment summary',
      mainButtonTitle: 'EUR 2.155,00',
    );
  }
}

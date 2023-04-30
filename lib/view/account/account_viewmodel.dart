import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_test_project/app/app.locator.dart';
import 'package:stacked_test_project/app/app.router.dart';
import 'package:stacked_test_project/enum/stage.dart';

import '../../enum/dialog_type.dart';

class AccountViewmodel extends BaseViewModel {
  final _navService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _snackbarService = locator<SnackbarService>();
  

  showDialog() async {
    final dialogResult = await _dialogService.showCustomDialog(
      variant: DialogType.basic,
      title: 'Stay with your business',
      description:
          '''Sign up to ensure that you dont't miss the next promotion and other important events in Personal Account.?''',
      secondaryButtonTitle: 'Next time',
      mainButtonTitle: 'Sign up',
    );
    if (!dialogResult!.confirmed) {
      _navService.navigateToHomeView();
    } else {
      showSnackbar();
    }
  }

  showSnackbar() {
    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.success,
      message: 'Dialog box closed ',
      title: 'Closed',
      duration: const Duration(seconds: 2),
      mainButtonTitle: 'Undo',
      onMainButtonTapped: () => showDialog(),
    );
  }


}

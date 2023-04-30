import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../enum/bottomsheet_type.dart';
import '../dialogs/basic_bottom_sheet.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.floatingBox: (context, sheetRequest, completer) =>
        FloatingBoxBottomSheet(request: sheetRequest, completer: completer)
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}

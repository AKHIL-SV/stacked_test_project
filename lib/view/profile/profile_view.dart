import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_test_project/view/profile/profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => ProfileViewmodel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'ProfileView',
                  textScaleFactor: 2,
                ),
                GestureDetector(
                  onTap: () {
                    model.showBottomSheet();
                  },
                  child: const Text(
                    'Bottom Sheet',
                    textScaleFactor: 2,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    model.navToAccountview();
                  },
                  child: const Text('Navigate To Account'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

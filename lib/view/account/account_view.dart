import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_test_project/view/account/account_viewmodel.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => AccountViewmodel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('AccountView',textScaleFactor: 2),
                ElevatedButton(
                  onPressed: () {
                    model.showDialog();
                  },
                  child: const Text('Navigate To Home'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

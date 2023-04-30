import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_test_project/view/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewmodel(),
      onViewModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'HomeView',
                    textScaleFactor: 2,
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Visibility(
                        visible: model.isloading,
                        replacement: Center(
                          child: Lottie.asset('assets/lottie/loadingintro.json',
                              height: 100),
                        ),
                        child: RefreshIndicator(
                          onRefresh: () => model.refresh(),
                          child: SingleChildScrollView(
                            controller: model.controller,
                            child: Column(
                              children: [
                                ListView.builder(
                                  itemCount: model.accountList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title:
                                          Text(model.accountList[index].name),
                                      subtitle:
                                          Text(model.accountList[index].email),
                                      leading: CircleAvatar(
                                          child: Text(model
                                              .accountList[index].gender[0]
                                              .toUpperCase())),
                                    );
                                  },
                                ),
                                model.isBusy
                                    ? SizedBox(
                                        height: 50,
                                        child: Lottie.asset(
                                          'assets/lottie/loading.json',
                                        ),
                                      )
                                    : const SizedBox(
                                        height: 50,
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      model.navProfileView();
                    },
                    child: const Text('Navigate To Profile'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

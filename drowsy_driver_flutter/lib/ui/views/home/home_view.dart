import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:drowsy_driver/ui/smart_widgets/online_status.dart';
import 'package:stacked/stacked.dart';

import 'package:lottie/lottie.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        // print(model.node?.lastSeen);
        return Scaffold(
            appBar: AppBar(
              title: const Text('Drowsy driver'),
              centerTitle: true,
              actions: [IsOnlineWidget()],
            ),
            body: model.data != null && model.data2 != null
                ? const _HomeBody()
                : Center(child: Text("No data")));
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class _HomeBody extends ViewModelWidget<HomeViewModel> {
  const _HomeBody({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("Is tilt: ${model.data!.isTilt}"),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("Is sleeping: ${model.data2!.isSleeping}"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: model.setStepper,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              "${!model.deviceData.isStepper ? "Run stepper" : "Stop stepper"}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // TextButton(
                      //   onPressed: model.setAlert,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       color: Colors.teal,
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(14.0),
                      //       child: Text(
                      //         "${model.deviceData.isAlert == model.servoMinAngle ? "Open" : "Close"} Box2",
                      //         style: const TextStyle(
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Slider(
                  value: model.deviceData.speed.toDouble(),
                  min: 1,
                  max: 5,
                  divisions: 5,
                  label: model.deviceData.speed.round().toString(),
                  onChanged: model.setSpeed,
                  onChangeEnd: (value) {
                    model.setDeviceData();
                  },
                ),
              ],
            ),
          ),
        ),
        if (model.data!.isTilt)
          Positioned.fill(
              child: Warning(
            message: "Accident detected",
          )),
        if (model.data2!.isSleeping)
          Positioned.fill(
              child: Warning(
            message: "Driver is sleeping",
          )),
      ],
    );
  }
}

class Warning extends StatelessWidget {
  final String message;
  const Warning({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Center(
        child: Card(
          // elevation: 10,
          color: Colors.black.withOpacity(0.5),
          child: Container(
            height: 400,
            width: 250,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.network(
                      'https://assets2.lottiefiles.com/packages/lf20_Tkwjw8.json'),
                  SizedBox(height: 20),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

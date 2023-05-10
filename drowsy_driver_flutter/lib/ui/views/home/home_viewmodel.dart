import 'package:drowsy_driver/models/models.dart';
import 'package:drowsy_driver/services/db_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
// import '../../setup_snackbar_ui.dart';

class HomeViewModel extends ReactiveViewModel {
  final log = getLogger('HomeViewModel');

  // final _snackBarService = locator<SnackbarService>();
  // final _navigationService = locator<NavigationService>();
  final _dbService = locator<DbService>();

  DeviceReading? get data => _dbService.node;
  DeviceReading2? get data2 => _dbService.node2;

  @override
  List<DbService> get reactiveServices => [_dbService];

  void onModelReady() {
    getDeviceData();
  }

  final int _servoMinAngle = 50;
  int get servoMinAngle => _servoMinAngle;
  final int _servoMaxAngle = 140;
  int get servoMaxAngle => _servoMaxAngle;

  DeviceData _deviceData = DeviceData(
    servo1: 40,
    servo2: 40,
    servo3: 90,
    isReadSensor: false,
  );
  DeviceData get deviceData => _deviceData;

  void setServo1() {
    if (_deviceData.servo1 == _servoMinAngle) {
      _deviceData.servo1 = servoMaxAngle;
    } else {
      _deviceData.servo1 = _servoMinAngle;
    }
    setDeviceData();
    notifyListeners();
  }

  void setServo2() {
    if (_deviceData.servo2 == _servoMinAngle) {
      _deviceData.servo2 = servoMaxAngle;
    } else {
      _deviceData.servo2 = _servoMinAngle;
    }
    setDeviceData();
    notifyListeners();
  }

  void setServo3(double value) {
    _deviceData.servo3 = value.toInt();
    notifyListeners();
    // setDeviceData();
  }

  void setDeviceData() {
    _dbService.setDeviceData(_deviceData);
  }

  void getDeviceData() async {
    setBusy(true);
    DeviceData? deviceData = await _dbService.getDeviceData();
    if (deviceData != null) {
      _deviceData = DeviceData(
          servo1: deviceData.servo1,
          servo2: deviceData.servo2,
          servo3: deviceData.servo3,
          isReadSensor: deviceData.isReadSensor);
    }
    setBusy(false);
  }
}

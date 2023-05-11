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

  DeviceData _deviceData = DeviceData(
    isStepper: false,
    isAlert: false,
    speed: 1,
  );
  DeviceData get deviceData => _deviceData;

  void setStepper() {
    _deviceData.isStepper = !_deviceData.isStepper;
    setDeviceData();
    notifyListeners();
  }

  void setAlert() {
    _deviceData.isAlert = !_deviceData.isAlert;
    setDeviceData();
    notifyListeners();
  }

  void setSpeed(double value) {
    _deviceData.speed = value.toInt();
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
          isStepper: deviceData.isStepper,
          isAlert: deviceData.isAlert,
          speed: deviceData.speed);
    }
    setBusy(false);
  }
}

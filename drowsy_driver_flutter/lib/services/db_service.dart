import 'package:firebase_database/firebase_database.dart';
import 'package:stacked/stacked.dart';

import '../app/app.logger.dart';
import '../models/models.dart';

class DbService with ReactiveServiceMixin {
  final log = getLogger('RealTimeDB_Service');

  FirebaseDatabase _db = FirebaseDatabase.instance;

  DeviceReading? _node;
  DeviceReading? get node => _node;
  DeviceReading2? _node2;
  DeviceReading2? get node2 => _node2;

  void setupNodeListening() {
    DatabaseReference starCountRef =
        _db.ref('/devices/bnkQpCxWeAOTBl5FTFduISW6eUd2/reading');
    starCountRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        _node = DeviceReading.fromMap(event.snapshot.value as Map);
        // log.v(_node?.lastSeen); //data['time']
        notifyListeners();
      }
    });
  }

  void setupNode2Listening() {
    DatabaseReference starCountRef =
        _db.ref('/devices/bnkQpCxWeAOTBl5FTFduISW6eUd2/reading');
    starCountRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        _node2 = DeviceReading2.fromMap(event.snapshot.value as Map);
        // log.v(_node?.lastSeen); //data['time']
        notifyListeners();
      }
    });
  }

  Future<DeviceData?> getDeviceData() async {
    DatabaseReference dataRef =
        _db.ref('/devices/bnkQpCxWeAOTBl5FTFduISW6eUd2/data');
    final value = await dataRef.once();
    if (value.snapshot.exists) {
      return DeviceData.fromMap(value.snapshot.value as Map);
    }
    return null;
  }

  void setDeviceData(DeviceData data) {
    log.i("Setting device data");
    DatabaseReference dataRef =
        _db.ref('/devices/bnkQpCxWeAOTBl5FTFduISW6eUd2/data');
    dataRef.update(data.toJson());
  }
}

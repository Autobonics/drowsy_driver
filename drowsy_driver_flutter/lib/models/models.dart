/// Institution model
class DeviceReading {
  double distance;
  bool isTilt;
  DateTime lastSeen;

  DeviceReading({
    required this.distance,
    required this.isTilt,
    required this.lastSeen,
  });

  factory DeviceReading.fromMap(Map data) {
    return DeviceReading(
      // distance: data['d'] ?? 0,
      distance: data['d'] != null
          ? (data['d'] % 1 == 0 ? data['d'] + 0.1 : data['d'])
          : 0,
      isTilt: data['tilt'] ?? false,
      lastSeen: DateTime.fromMillisecondsSinceEpoch(data['ts']),
    );
  }
}

class DeviceReading2 {
  bool isSleeping;

  DeviceReading2({
    required this.isSleeping,
  });

  factory DeviceReading2.fromMap(Map data) {
    return DeviceReading2(
      isSleeping: data["isSleeping"] ?? false,
    );
  }
}

/// Device control model
class DeviceData {
  int servo1;
  int servo2;
  int servo3;
  bool isReadSensor;

  DeviceData({
    required this.servo1,
    required this.servo2,
    required this.servo3,
    required this.isReadSensor,
  });

  factory DeviceData.fromMap(Map data) {
    return DeviceData(
      servo1: data['servo1'] ?? 0,
      servo2: data['servo2'] ?? 0,
      servo3: data['servo3'] ?? 0,
      isReadSensor: data['isReadSensor'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'servo1': servo1,
        'servo2': servo2,
        'servo3': servo3,
        'isReadSensor': isReadSensor,
      };
}

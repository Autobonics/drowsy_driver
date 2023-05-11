/// Institution model
class DeviceReading {
  bool isTilt;
  DateTime lastSeen;

  DeviceReading({
    required this.isTilt,
    required this.lastSeen,
  });

  factory DeviceReading.fromMap(Map data) {
    return DeviceReading(
      isTilt: data['isTilt'] ?? false,
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
  bool isStepper;
  bool isAlert;
  int speed;

  DeviceData({
    required this.isStepper,
    required this.isAlert,
    required this.speed,
  });

  factory DeviceData.fromMap(Map data) {
    return DeviceData(
      isStepper: data['isStepper'] ?? false,
      isAlert: data['isAlert'] ?? false,
      speed: data['speed'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() => {
        'isStepper': isStepper,
        'isAlert': isAlert,
        'speed': speed,
      };
}

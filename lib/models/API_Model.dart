class API_Model {
  late  String altitude;
  late  String angle;
  late  String batteryCurrent;
  late  String batteryVoltage;
  late  String externalVoltage;
  late  String gNSSDOP;
  late  String gNSSFIX;
  late String gNSSHDOP;
  late String gSMSignal;
  late String gSMOperator;
  late String idling;
  late String latitude;
  late String longitude;
  late String movement;
  late String satellite;
  late String sleepMode;
  late String totalOdometer;
  late String tripStatus;
  late String unplug;
  late  String addedDate;
  late int id;
  late String ignition;
  late String imei;
  late String lastUpdated;
  late String speed;
  late String timestamp;

  API_Model(
      { required this.altitude,
       required  this.angle,
      required this.batteryCurrent,
      required this.batteryVoltage,
      required this.externalVoltage,
      required this.gNSSDOP,
      required this.gNSSFIX,
      required this.gNSSHDOP,
      required this.gSMSignal,
      required this.gSMOperator,
      required this.idling,
      required this.latitude,
      required this.longitude,
      required this.movement,
      required this.satellite,
      required this.sleepMode,
      required this.totalOdometer,
      required this.tripStatus,
      required this.unplug,
      required this.addedDate,
      required this.id,
      required this.ignition,
      required this.imei,
      required this.lastUpdated,
      required this.speed,
      required this.timestamp});

  API_Model.fromJson(Map< String, dynamic> json) {
    altitude = json['Altitude'];
    angle = json['Angle'];
    batteryCurrent = json['BatteryCurrent'];
    batteryVoltage = json['BatteryVoltage'];
    externalVoltage = json['ExternalVoltage'];
    gNSSDOP = json['GNSSDOP'];
    gNSSFIX = json['GNSS_FIX'];
    gNSSHDOP = json['GNSS_HDOP'];
    gSMSignal = json['GSMSignal'];
    gSMOperator = json['GSM_Operator'];
    idling = json['Idling'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    movement = json['Movement'];
    satellite = json['Satellite'];
    sleepMode = json['SleepMode'];
    totalOdometer = json['Total_Odometer'];
    tripStatus = json['TripStatus'];
    unplug = json['Unplug'];
    addedDate = json['added_date'];
    id = json['id'];
    ignition = json['ignition'];
    imei = json['imei'];
    lastUpdated = json['last_updated'];
    speed = json['speed'];
    timestamp = json['timestamp'];
  }

  Map< String, dynamic> toJson() {
    final Map< String, dynamic> data = new Map< String, dynamic>();
    data['Altitude'] =  this.altitude;
    data['Angle'] =  this.angle;
    data['BatteryCurrent'] =  this.batteryCurrent;
    data['BatteryVoltage'] =  this.batteryVoltage;
    data['ExternalVoltage'] =  this.externalVoltage;
    data['GNSSDOP'] =  this.gNSSDOP;
    data['GNSS_FIX'] =  this.gNSSFIX;
    data['GNSS_HDOP'] =  this.gNSSHDOP;
    data['GSMSignal'] =  this.gSMSignal;
    data['GSM_Operator'] =  this.gSMOperator;
    data['Idling'] =  this.idling;
    data['Latitude'] =  this.latitude;
    data['Longitude'] =  this.longitude;
    data['Movement'] =  this.movement;
    data['Satellite'] =  this.satellite;
    data['SleepMode'] =  this.sleepMode;
    data['Total_Odometer'] =  this.totalOdometer;
    data['TripStatus'] =  this.tripStatus;
    data['Unplug'] =  this.unplug;
    data['added_date'] =  this.addedDate;
    data['id'] =  this.id;
    data['ignition'] = this.ignition;
    data['imei'] =  this.imei;
    data['last_updated'] =  this.lastUpdated;
    data['speed'] =  this.speed;
    data['timestamp'] =  this.timestamp;
    return data;
  }
}

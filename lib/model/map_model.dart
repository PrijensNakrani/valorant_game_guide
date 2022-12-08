// To parse this JSON data, do
//
//     final mapResponseModel = mapResponseModelFromJson(jsonString);

import 'dart:convert';

MapResponseModel mapResponseModelFromJson(String str) =>
    MapResponseModel.fromJson(json.decode(str));

String mapResponseModelToJson(MapResponseModel data) =>
    json.encode(data.toJson());

class MapResponseModel {
  MapResponseModel({
    this.status,
    this.data,
  });

  int? status;
  List<Datum>? data;

  factory MapResponseModel.fromJson(Map<String, dynamic> json) =>
      MapResponseModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.uuid,
    this.displayName,
    this.coordinates,
    this.displayIcon,
    this.listViewIcon,
    this.splash,
    this.assetPath,
    this.mapUrl,
    this.xMultiplier,
    this.yMultiplier,
    this.xScalarToAdd,
    this.yScalarToAdd,
    this.callouts,
  });

  String? uuid;
  String? displayName;
  String? coordinates;
  String? displayIcon;
  String? listViewIcon;
  String? splash;
  String? assetPath;
  String? mapUrl;
  double? xMultiplier;
  double? yMultiplier;
  double? xScalarToAdd;
  double? yScalarToAdd;
  List<Callout>? callouts;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        coordinates: json["coordinates"],
        displayIcon: json["displayIcon"] == null ? null : json["displayIcon"],
        listViewIcon: json["listViewIcon"],
        splash: json["splash"],
        assetPath: json["assetPath"],
        mapUrl: json["mapUrl"],
        xMultiplier: json["xMultiplier"].toDouble(),
        yMultiplier: json["yMultiplier"].toDouble(),
        xScalarToAdd: json["xScalarToAdd"].toDouble(),
        yScalarToAdd: json["yScalarToAdd"].toDouble(),
        callouts: json["callouts"] == null
            ? null
            : List<Callout>.from(
                json["callouts"].map((x) => Callout.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "coordinates": coordinates,
        "displayIcon": displayIcon == null ? null : displayIcon,
        "listViewIcon": listViewIcon,
        "splash": splash,
        "assetPath": assetPath,
        "mapUrl": mapUrl,
        "xMultiplier": xMultiplier,
        "yMultiplier": yMultiplier,
        "xScalarToAdd": xScalarToAdd,
        "yScalarToAdd": yScalarToAdd,
        "callouts": callouts == null
            ? null
            : List<dynamic>.from(callouts!.map((x) => x.toJson())),
      };
}

class Callout {
  Callout({
    this.regionName,
    this.superRegionName,
    this.location,
  });

  String? regionName;
  String? superRegionName;
  Location? location;

  factory Callout.fromJson(Map<String, dynamic> json) => Callout(
        regionName: json["regionName"],
        superRegionName: json["superRegionName"],
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "regionName": regionName,
        "superRegionName": superRegionName,
        "location": location!.toJson(),
      };
}

class Location {
  Location({
    this.x,
    this.y,
  });

  double? x;
  double? y;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

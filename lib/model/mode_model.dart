// To parse this JSON data, do
//
//     final modeResponseModel = modeResponseModelFromJson(jsonString);

import 'dart:convert';

ModeResponseModel modeResponseModelFromJson(String str) =>
    ModeResponseModel.fromJson(json.decode(str));

String modeResponseModelToJson(ModeResponseModel data) =>
    json.encode(data.toJson());

class ModeResponseModel {
  ModeResponseModel({
    this.status,
    this.data,
  });

  int? status;
  List<Datum>? data;

  factory ModeResponseModel.fromJson(Map<String, dynamic> json) =>
      ModeResponseModel(
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
    this.duration,
    this.allowsMatchTimeouts,
    this.isTeamVoiceAllowed,
    this.isMinimapHidden,
    this.orbCount,
    this.teamRoles,
    this.gameFeatureOverrides,
    this.gameRuleBoolOverrides,
    this.displayIcon,
    this.assetPath,
  });

  String? uuid;
  String? displayName;
  String? duration;
  bool? allowsMatchTimeouts;
  bool? isTeamVoiceAllowed;
  bool? isMinimapHidden;
  int? orbCount;
  List<String>? teamRoles;
  List<GameFeatureOverride>? gameFeatureOverrides;
  List<GameRuleBoolOverride>? gameRuleBoolOverrides;
  String? displayIcon;
  String? assetPath;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        duration: json["duration"] == null ? null : json["duration"],
        allowsMatchTimeouts: json["allowsMatchTimeouts"],
        isTeamVoiceAllowed: json["isTeamVoiceAllowed"],
        isMinimapHidden: json["isMinimapHidden"],
        orbCount: json["orbCount"],
        teamRoles: json["teamRoles"] == null
            ? null
            : List<String>.from(json["teamRoles"].map((x) => x)),
        gameFeatureOverrides: json["gameFeatureOverrides"] == null
            ? null
            : List<GameFeatureOverride>.from(json["gameFeatureOverrides"]
                .map((x) => GameFeatureOverride.fromJson(x))),
        gameRuleBoolOverrides: json["gameRuleBoolOverrides"] == null
            ? null
            : List<GameRuleBoolOverride>.from(json["gameRuleBoolOverrides"]
                .map((x) => GameRuleBoolOverride.fromJson(x))),
        displayIcon: json["displayIcon"] == null ? null : json["displayIcon"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "duration": duration == null ? null : duration,
        "allowsMatchTimeouts": allowsMatchTimeouts,
        "isTeamVoiceAllowed": isTeamVoiceAllowed,
        "isMinimapHidden": isMinimapHidden,
        "orbCount": orbCount,
        "teamRoles": teamRoles == null
            ? null
            : List<dynamic>.from(teamRoles!.map((x) => x)),
        "gameFeatureOverrides": gameFeatureOverrides == null
            ? null
            : List<dynamic>.from(gameFeatureOverrides!.map((x) => x.toJson())),
        "gameRuleBoolOverrides": gameRuleBoolOverrides == null
            ? null
            : List<dynamic>.from(gameRuleBoolOverrides!.map((x) => x.toJson())),
        "displayIcon": displayIcon == null ? null : displayIcon,
        "assetPath": assetPath,
      };
}

class GameFeatureOverride {
  GameFeatureOverride({
    this.featureName,
    this.state,
  });

  String? featureName;
  bool? state;

  factory GameFeatureOverride.fromJson(Map<String, dynamic> json) =>
      GameFeatureOverride(
        featureName: json["featureName"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "featureName": featureName,
        "state": state,
      };
}

class GameRuleBoolOverride {
  GameRuleBoolOverride({
    this.ruleName,
    this.state,
  });

  String? ruleName;
  bool? state;

  factory GameRuleBoolOverride.fromJson(Map<String, dynamic> json) =>
      GameRuleBoolOverride(
        ruleName: json["ruleName"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "ruleName": ruleName,
        "state": state,
      };
}

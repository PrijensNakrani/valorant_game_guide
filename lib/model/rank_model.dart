// To parse this JSON data, do
//
//     final rankResponseModel = rankResponseModelFromJson(jsonString);

import 'dart:convert';

RankResponseModel rankResponseModelFromJson(String str) =>
    RankResponseModel.fromJson(json.decode(str));

String rankResponseModelToJson(RankResponseModel data) =>
    json.encode(data.toJson());

class RankResponseModel {
  RankResponseModel({
    this.status,
    this.data,
  });

  int? status;
  List<Datum>? data;

  factory RankResponseModel.fromJson(Map<String, dynamic> json) =>
      RankResponseModel(
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
    this.assetObjectName,
    this.tiers,
    this.assetPath,
  });

  String? uuid;
  String? assetObjectName;
  List<Tier>? tiers;
  String? assetPath;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        assetObjectName: json["assetObjectName"],
        tiers: List<Tier>.from(json["tiers"].map((x) => Tier.fromJson(x))),
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "assetObjectName": assetObjectName,
        "tiers": List<dynamic>.from(tiers!.map((x) => x.toJson())),
        "assetPath": assetPath,
      };
}

class Tier {
  Tier({
    this.tier,
    this.tierName,
    this.division,
    this.divisionName,
    this.color,
    this.backgroundColor,
    this.smallIcon,
    this.largeIcon,
    this.rankTriangleDownIcon,
    this.rankTriangleUpIcon,
  });

  int? tier;
  String? tierName;
  String? division;
  String? divisionName;
  String? color;
  String? backgroundColor;
  String? smallIcon;
  String? largeIcon;
  String? rankTriangleDownIcon;
  String? rankTriangleUpIcon;

  factory Tier.fromJson(Map<String, dynamic> json) => Tier(
        tier: json["tier"],
        tierName: json["tierName"],
        division: json["division"],
        divisionName: json["divisionName"],
        color: json["color"],
        backgroundColor: json["backgroundColor"],
        smallIcon: json["smallIcon"] == null ? null : json["smallIcon"],
        largeIcon: json["largeIcon"] == null ? null : json["largeIcon"],
        rankTriangleDownIcon: json["rankTriangleDownIcon"] == null
            ? null
            : json["rankTriangleDownIcon"],
        rankTriangleUpIcon: json["rankTriangleUpIcon"] == null
            ? null
            : json["rankTriangleUpIcon"],
      );

  Map<String, dynamic> toJson() => {
        "tier": tier,
        "tierName": tierName,
        "division": division,
        "divisionName": divisionName,
        "color": color,
        "backgroundColor": backgroundColor,
        "smallIcon": smallIcon == null ? null : smallIcon,
        "largeIcon": largeIcon == null ? null : largeIcon,
        "rankTriangleDownIcon":
            rankTriangleDownIcon == null ? null : rankTriangleDownIcon,
        "rankTriangleUpIcon":
            rankTriangleUpIcon == null ? null : rankTriangleUpIcon,
      };
}

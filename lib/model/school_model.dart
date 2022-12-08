// To parse this JSON data, do
//
//     final schoolModel = schoolModelFromJson(jsonString);

import 'dart:convert';

SchoolModel schoolModelFromJson(String str) =>
    SchoolModel.fromJson(json.decode(str));

String schoolModelToJson(SchoolModel data) => json.encode(data.toJson());

class SchoolModel {
  SchoolModel({
    this.clients,
  });

  List<Client>? clients;

  factory SchoolModel.fromJson(Map<String, dynamic> json) => SchoolModel(
        clients:
            List<Client>.from(json["clients"].map((x) => Client.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clients": List<dynamic>.from(clients!.map((x) => x.toJson())),
      };
}

class Client {
  Client({
    this.clientKey,
    this.name,
    this.value,
    this.logoUrl,
    this.color,
    this.type,
    this.host,
  });

  String? clientKey;
  String? name;
  String? value;
  String? logoUrl;
  String? color;
  String? type;
  String? host;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        clientKey: json["client_key"],
        name: json["name"],
        value: json["value"],
        logoUrl: json["logo_url"] == null ? null : json["logo_url"],
        color: json["color"],
        type: json["type"],
        host: json["host"],
      );

  Map<String, dynamic> toJson() => {
        "client_key": clientKey,
        "name": name,
        "value": value,
        "logo_url": logoUrl == null ? null : logoUrl,
        "color": color,
        "type": type,
        "host": host,
      };
}

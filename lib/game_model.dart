// To parse this JSON data, do
//
//     final game = gameFromJson(jsonString);

import 'dart:convert';

Game gameFromJson(String str) => Game.fromJson(json.decode(str));

String gameToJson(Game data) => json.encode(data.toJson());

class Game {
  Info info;
  List<Item> item;

  Game({
    required this.info,
    required this.item,
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        info: Info.fromJson(json["info"]),
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
      };
}

class Info {
  String postmanId;
  String name;
  String schema;
  String exporterId;

  Info({
    required this.postmanId,
    required this.name,
    required this.schema,
    required this.exporterId,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        postmanId: json["_postman_id"],
        name: json["name"],
        schema: json["schema"],
        exporterId: json["_exporter_id"],
      );

  Map<String, dynamic> toJson() => {
        "_postman_id": postmanId,
        "name": name,
        "schema": schema,
        "_exporter_id": exporterId,
      };
}

class Item {
  String name;
  Request request;
  List<dynamic> response;

  Item({
    required this.name,
    required this.request,
    required this.response,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        request: Request.fromJson(json["request"]),
        response: List<dynamic>.from(json["response"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "request": request.toJson(),
        "response": List<dynamic>.from(response.map((x) => x)),
      };
}

class Request {
  String method;
  List<Header> header;
  Url url;
  Body? body;

  Request({
    required this.method,
    required this.header,
    required this.url,
    this.body,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        method: json["method"],
        header:
            List<Header>.from(json["header"].map((x) => Header.fromJson(x))),
        url: Url.fromJson(json["url"]),
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "method": method,
        "header": List<dynamic>.from(header.map((x) => x.toJson())),
        "url": url.toJson(),
        "body": body?.toJson(),
      };
}

class Body {
  String mode;
  String raw;
  Options options;

  Body({
    required this.mode,
    required this.raw,
    required this.options,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        mode: json["mode"],
        raw: json["raw"],
        options: Options.fromJson(json["options"]),
      );

  Map<String, dynamic> toJson() => {
        "mode": mode,
        "raw": raw,
        "options": options.toJson(),
      };
}

class Options {
  Raw raw;

  Options({
    required this.raw,
  });

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        raw: Raw.fromJson(json["raw"]),
      );

  Map<String, dynamic> toJson() => {
        "raw": raw.toJson(),
      };
}

class Raw {
  String language;

  Raw({
    required this.language,
  });

  factory Raw.fromJson(Map<String, dynamic> json) => Raw(
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "language": language,
      };
}

class Header {
  Key key;
  String value;
  Type type;

  Header({
    required this.key,
    required this.value,
    required this.type,
  });

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        key: keyValues.map[json["key"]]!,
        value: json["value"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "key": keyValues.reverse[key],
        "value": value,
        "type": typeValues.reverse[type],
      };
}

enum Key { ACCEPT, API_KEY, LOCALE }

final keyValues = EnumValues(
    {"Accept": Key.ACCEPT, "Api-Key": Key.API_KEY, "Locale": Key.LOCALE});

enum Type { TEXT }

final typeValues = EnumValues({"text": Type.TEXT});

class Url {
  String raw;
  String protocol;
  List<Host> host;
  List<String> path;

  Url({
    required this.raw,
    required this.protocol,
    required this.host,
    required this.path,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        raw: json["raw"],
        protocol: json["protocol"],
        host: List<Host>.from(json["host"].map((x) => hostValues.map[x]!)),
        path: List<String>.from(json["path"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "protocol": protocol,
        "host": List<dynamic>.from(host.map((x) => hostValues.reverse[x])),
        "path": List<dynamic>.from(path.map((x) => x)),
      };
}

enum Host { STAGE, SWALEKHAN, ORG }

final hostValues = EnumValues(
    {"org": Host.ORG, "stage": Host.STAGE, "swalekhan": Host.SWALEKHAN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

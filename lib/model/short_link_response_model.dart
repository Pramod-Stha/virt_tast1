import 'dart:convert';

class ShortLinkResponseModel {
  final String id;
  final String title;
  final String slashtag;
  final String destination;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic expiredAt;
  final String status;
  final List<dynamic> tags;
  final String linkType;
  final int clicks;
  final bool isPublic;
  final String shortUrl;
  final String domainId;
  final String domainName;
  final Domain domain;
  final bool https;
  final bool favourite;
  final Creator creator;
  final bool integrated;

  ShortLinkResponseModel({
    required this.id,
    required this.title,
    required this.slashtag,
    required this.destination,
    required this.createdAt,
    required this.updatedAt,
    required this.expiredAt,
    required this.status,
    required this.tags,
    required this.linkType,
    required this.clicks,
    required this.isPublic,
    required this.shortUrl,
    required this.domainId,
    required this.domainName,
    required this.domain,
    required this.https,
    required this.favourite,
    required this.creator,
    required this.integrated,
  });

  ShortLinkResponseModel copyWith({
    String? id,
    String? title,
    String? slashtag,
    String? destination,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic expiredAt,
    String? status,
    List<dynamic>? tags,
    String? linkType,
    int? clicks,
    bool? isPublic,
    String? shortUrl,
    String? domainId,
    String? domainName,
    Domain? domain,
    bool? https,
    bool? favourite,
    Creator? creator,
    bool? integrated,
  }) =>
      ShortLinkResponseModel(
        id: id ?? this.id,
        title: title ?? this.title,
        slashtag: slashtag ?? this.slashtag,
        destination: destination ?? this.destination,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        expiredAt: expiredAt ?? this.expiredAt,
        status: status ?? this.status,
        tags: tags ?? this.tags,
        linkType: linkType ?? this.linkType,
        clicks: clicks ?? this.clicks,
        isPublic: isPublic ?? this.isPublic,
        shortUrl: shortUrl ?? this.shortUrl,
        domainId: domainId ?? this.domainId,
        domainName: domainName ?? this.domainName,
        domain: domain ?? this.domain,
        https: https ?? this.https,
        favourite: favourite ?? this.favourite,
        creator: creator ?? this.creator,
        integrated: integrated ?? this.integrated,
      );

  factory ShortLinkResponseModel.fromRawJson(String str) => ShortLinkResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShortLinkResponseModel.fromJson(Map<String, dynamic> json) => ShortLinkResponseModel(
    id: json["id"],
    title: json["title"],
    slashtag: json["slashtag"],
    destination: json["destination"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    expiredAt: json["expiredAt"],
    status: json["status"],
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
    linkType: json["linkType"],
    clicks: json["clicks"],
    isPublic: json["isPublic"],
    shortUrl: json["shortUrl"],
    domainId: json["domainId"],
    domainName: json["domainName"],
    domain: Domain.fromJson(json["domain"]),
    https: json["https"],
    favourite: json["favourite"],
    creator: Creator.fromJson(json["creator"]),
    integrated: json["integrated"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slashtag": slashtag,
    "destination": destination,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "expiredAt": expiredAt,
    "status": status,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "linkType": linkType,
    "clicks": clicks,
    "isPublic": isPublic,
    "shortUrl": shortUrl,
    "domainId": domainId,
    "domainName": domainName,
    "domain": domain.toJson(),
    "https": https,
    "favourite": favourite,
    "creator": creator.toJson(),
    "integrated": integrated,
  };
}

class Creator {
  final String id;
  final String fullName;
  final String avatarUrl;

  Creator({
    required this.id,
    required this.fullName,
    required this.avatarUrl,
  });

  Creator copyWith({
    String? id,
    String? fullName,
    String? avatarUrl,
  }) =>
      Creator(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        avatarUrl: avatarUrl ?? this.avatarUrl,
      );

  factory Creator.fromRawJson(String str) => Creator.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
    id: json["id"],
    fullName: json["fullName"],
    avatarUrl: json["avatarUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "avatarUrl": avatarUrl,
  };
}

class Domain {
  final String id;
  final String ref;
  final String fullName;
  final Sharing sharing;
  final bool active;

  Domain({
    required this.id,
    required this.ref,
    required this.fullName,
    required this.sharing,
    required this.active,
  });

  Domain copyWith({
    String? id,
    String? ref,
    String? fullName,
    Sharing? sharing,
    bool? active,
  }) =>
      Domain(
        id: id ?? this.id,
        ref: ref ?? this.ref,
        fullName: fullName ?? this.fullName,
        sharing: sharing ?? this.sharing,
        active: active ?? this.active,
      );

  factory Domain.fromRawJson(String str) => Domain.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Domain.fromJson(Map<String, dynamic> json) => Domain(
    id: json["id"],
    ref: json["ref"],
    fullName: json["fullName"],
    sharing: Sharing.fromJson(json["sharing"]),
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ref": ref,
    "fullName": fullName,
    "sharing": sharing.toJson(),
    "active": active,
  };
}

class Sharing {
  final Protocol protocol;

  Sharing({
    required this.protocol,
  });

  Sharing copyWith({
    Protocol? protocol,
  }) =>
      Sharing(
        protocol: protocol ?? this.protocol,
      );

  factory Sharing.fromRawJson(String str) => Sharing.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sharing.fromJson(Map<String, dynamic> json) => Sharing(
    protocol: Protocol.fromJson(json["protocol"]),
  );

  Map<String, dynamic> toJson() => {
    "protocol": protocol.toJson(),
  };
}

class Protocol {
  final List<String> allowed;
  final String protocolDefault;

  Protocol({
    required this.allowed,
    required this.protocolDefault,
  });

  Protocol copyWith({
    List<String>? allowed,
    String? protocolDefault,
  }) =>
      Protocol(
        allowed: allowed ?? this.allowed,
        protocolDefault: protocolDefault ?? this.protocolDefault,
      );

  factory Protocol.fromRawJson(String str) => Protocol.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Protocol.fromJson(Map<String, dynamic> json) => Protocol(
    allowed: List<String>.from(json["allowed"].map((x) => x)),
    protocolDefault: json["default"],
  );

  Map<String, dynamic> toJson() => {
    "allowed": List<dynamic>.from(allowed.map((x) => x)),
    "default": protocolDefault,
  };
}

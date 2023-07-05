class AgentsResponseModel {
  AgentsResponseModel({
    required this.status,
    required this.data,
  });

  final int? status;
  final List<Datum> data;

  factory AgentsResponseModel.fromJson(Map<String, dynamic> json) {
    return AgentsResponseModel(
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class Datum {
  Datum({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    required this.characterTags,
    required this.displayIcon,
    required this.displayIconSmall,
    required this.bustPortrait,
    required this.fullPortrait,
    required this.fullPortraitV2,
    required this.killfeedPortrait,
    required this.background,
    required this.backgroundGradientColors,
    required this.assetPath,
    required this.isFullPortraitRightFacing,
    required this.isPlayableCharacter,
    required this.isAvailableForTest,
    required this.isBaseContent,
    required this.role,
    required this.abilities,
    required this.voiceLine,
  });

  final String? uuid;
  final String? displayName;
  final String? description;
  final String? developerName;
  final List<String> characterTags;
  final String? displayIcon;
  final String? displayIconSmall;
  final String? bustPortrait;
  final String? fullPortrait;
  final String? fullPortraitV2;
  final String? killfeedPortrait;
  final String? background;
  final List<String> backgroundGradientColors;
  final String? assetPath;
  final bool? isFullPortraitRightFacing;
  final bool? isPlayableCharacter;
  final bool? isAvailableForTest;
  final bool? isBaseContent;
  final Role? role;
  final List<Ability> abilities;
  final VoiceLine? voiceLine;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      uuid: json["uuid"],
      displayName: json["displayName"],
      description: json["description"],
      developerName: json["developerName"],
      characterTags: json["characterTags"] == null
          ? []
          : List<String>.from(json["characterTags"]!.map((x) => x)),
      displayIcon: json["displayIcon"],
      displayIconSmall: json["displayIconSmall"],
      bustPortrait: json["bustPortrait"],
      fullPortrait: json["fullPortrait"],
      fullPortraitV2: json["fullPortraitV2"],
      killfeedPortrait: json["killfeedPortrait"],
      background: json["background"],
      backgroundGradientColors: json["backgroundGradientColors"] == null
          ? []
          : List<String>.from(json["backgroundGradientColors"]!.map((x) => x)),
      assetPath: json["assetPath"],
      isFullPortraitRightFacing: json["isFullPortraitRightFacing"],
      isPlayableCharacter: json["isPlayableCharacter"],
      isAvailableForTest: json["isAvailableForTest"],
      isBaseContent: json["isBaseContent"],
      role: json["role"] == null ? null : Role.fromJson(json["role"]),
      abilities: json["abilities"] == null
          ? []
          : List<Ability>.from(
              json["abilities"]!.map((x) => Ability.fromJson(x))),
      voiceLine: json["voiceLine"] == null
          ? null
          : VoiceLine.fromJson(json["voiceLine"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        "developerName": developerName,
        "characterTags": characterTags.map((x) => x).toList(),
        "displayIcon": displayIcon,
        "displayIconSmall": displayIconSmall,
        "bustPortrait": bustPortrait,
        "fullPortrait": fullPortrait,
        "fullPortraitV2": fullPortraitV2,
        "killfeedPortrait": killfeedPortrait,
        "background": background,
        "backgroundGradientColors":
            backgroundGradientColors.map((x) => x).toList(),
        "assetPath": assetPath,
        "isFullPortraitRightFacing": isFullPortraitRightFacing,
        "isPlayableCharacter": isPlayableCharacter,
        "isAvailableForTest": isAvailableForTest,
        "isBaseContent": isBaseContent,
        "role": role?.toJson(),
        "abilities": abilities.map((x) => x.toJson()).toList(),
        "voiceLine": voiceLine?.toJson(),
      };
}

class Ability {
  Ability({
    required this.slot,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  final String? slot;
  final String? displayName;
  final String? description;
  final String? displayIcon;

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      slot: json["slot"],
      displayName: json["displayName"],
      description: json["description"],
      displayIcon: json["displayIcon"],
    );
  }

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
      };
}

class Role {
  Role({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.assetPath,
  });

  final String? uuid;
  final String? displayName;
  final String? description;
  final String? displayIcon;
  final String? assetPath;

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      uuid: json["uuid"],
      displayName: json["displayName"],
      description: json["description"],
      displayIcon: json["displayIcon"],
      assetPath: json["assetPath"],
    );
  }

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
      };
}

class VoiceLine {
  VoiceLine({
    required this.minDuration,
    required this.maxDuration,
    required this.mediaList,
  });

  final double? minDuration;
  final double? maxDuration;
  final List<MediaList> mediaList;

  factory VoiceLine.fromJson(Map<String, dynamic> json) {
    return VoiceLine(
      minDuration: json["minDuration"],
      maxDuration: json["maxDuration"],
      mediaList: json["mediaList"] == null
          ? []
          : List<MediaList>.from(
              json["mediaList"]!.map((x) => MediaList.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "minDuration": minDuration,
        "maxDuration": maxDuration,
        "mediaList": mediaList.map((x) => x.toJson()).toList(),
      };
}

class MediaList {
  MediaList({
    required this.id,
    required this.wwise,
    required this.wave,
  });

  final int? id;
  final String? wwise;
  final String? wave;

  factory MediaList.fromJson(Map<String, dynamic> json) {
    return MediaList(
      id: json["id"],
      wwise: json["wwise"],
      wave: json["wave"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "wwise": wwise,
        "wave": wave,
      };
}

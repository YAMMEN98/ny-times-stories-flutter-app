import 'package:json_annotation/json_annotation.dart';
import 'package:stories_app_flutter/src/features/ny_times_stories/data/entities/multi_media_model.dart';

part 'story_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StoryModel {
  StoryModel({
     this.section,
     this.subsection,
     this.title,
     this.abstract,
     this.url,
     this.uri,
     this.byline,
     this.itemType,
     this.updatedDate,
     this.createdDate,
     this.publishedDate,
     this.materialTypeFacet,
     this.kicker,
     this.desFacet,
     this.orgFacet,
     this.perFacet,
     this.geoFacet,
    this.multimedia,
     this.shortUrl,
  });

  late final String? section;
  late final String? subsection;
  late final String? title;
  late final String? abstract;
  late final String? url;
  late final String? uri;
  late final String? byline;
  late final String? itemType;
  late final String? updatedDate;
  late final String? createdDate;
  late final String? publishedDate;
  late final String? materialTypeFacet;
  late final String? kicker;
  late final List<String>? desFacet;
  late final List<String>? orgFacet;
  late final List<String>? perFacet;
  late final List<String>? geoFacet;
  late final List<MultiMediaModel>? multimedia;
  late final String? shortUrl;

  factory StoryModel.fromJson(json) => _$StoryModelFromJson(json);

  toJson() => _$StoryModelToJson(this);

  static List<StoryModel> fromJsonList(List json) {
    return json.map((e) => StoryModel.fromJson(e)).toList();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is StoryModel) {
      return other.section == section;
    }

    return false;
  }
}

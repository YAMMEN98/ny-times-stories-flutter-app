// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) => StoryModel(
      section: json['section'] as String,
      subsection: json['subsection'] as String?,
      title: json['title'] as String?,
      abstract: json['abstract'] as String?,
      url: json['url'] as String?,
      uri: json['uri'] as String,
      byline: json['byline'] as String?,
      itemType: json['item_type'] as String,
      updatedDate: json['updated_date'] as String,
      createdDate: json['created_date'] as String,
      publishedDate: json['published_date'] as String?,
      materialTypeFacet: json['material_type_facet'] as String,
      kicker: json['kicker'] as String,
      desFacet:
          (json['des_facet'] as List<dynamic>).map((e) => e as String).toList(),
      orgFacet:
          (json['org_facet'] as List<dynamic>).map((e) => e as String).toList(),
      perFacet:
          (json['per_facet'] as List<dynamic>).map((e) => e as String).toList(),
      geoFacet:
          (json['geo_facet'] as List<dynamic>).map((e) => e as String).toList(),
      multimedia: (json['multimedia'] as List<dynamic>?)
          ?.map((e) => MultiMediaModel.fromJson(e))
          .toList(),
      shortUrl: json['short_url'] as String,
    );

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'section': instance.section,
      'subsection': instance.subsection,
      'title': instance.title,
      'abstract': instance.abstract,
      'url': instance.url,
      'uri': instance.uri,
      'byline': instance.byline,
      'item_type': instance.itemType,
      'updated_date': instance.updatedDate,
      'created_date': instance.createdDate,
      'published_date': instance.publishedDate,
      'material_type_facet': instance.materialTypeFacet,
      'kicker': instance.kicker,
      'des_facet': instance.desFacet,
      'org_facet': instance.orgFacet,
      'per_facet': instance.perFacet,
      'geo_facet': instance.geoFacet,
      'multimedia': instance.multimedia,
      'short_url': instance.shortUrl,
    };

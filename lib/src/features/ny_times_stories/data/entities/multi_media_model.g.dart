// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultiMediaModel _$MultiMediaModelFromJson(Map<String, dynamic> json) =>
    MultiMediaModel(
      url: json['url'] as String,
      format: json['format'] as String,
      height: json['height'] as int,
      width: json['width'] as int,
      type: json['type'] as String,
      subtype: json['subtype'] as String,
      caption: json['caption'] as String,
      copyright: json['copyright'] as String,
    );

Map<String, dynamic> _$MultiMediaModelToJson(MultiMediaModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'format': instance.format,
      'height': instance.height,
      'width': instance.width,
      'type': instance.type,
      'subtype': instance.subtype,
      'caption': instance.caption,
      'copyright': instance.copyright,
    };

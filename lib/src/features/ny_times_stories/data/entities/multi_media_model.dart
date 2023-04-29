import 'package:json_annotation/json_annotation.dart';

part 'multi_media_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MultiMediaModel {
  MultiMediaModel({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
  });

  late final String url;
  late final String format;
  late final int height;
  late final int width;
  late final String type;
  late final String subtype;
  late final String caption;
  late final String copyright;

  factory MultiMediaModel.fromJson(json) => _$MultiMediaModelFromJson(json);

  toJson() => _$MultiMediaModelToJson(this);

  static List<MultiMediaModel> fromJsonList(List json) {
    return json.map((e) => MultiMediaModel.fromJson(e)).toList();
  }
}

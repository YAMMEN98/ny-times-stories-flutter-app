import 'package:flutter/foundation.dart';

class ApiResponse<T> {
  ApiResponse({
     this.status,
     this.copyright,
     this.section,
     this.last_updated,
     this.numResults,
     this.results,
  });

  late final String? status;
  late final String? copyright;
  late final String? section;
  late final String? last_updated;
  late final int? numResults;
  late final T? results;

  factory ApiResponse.fromJson(Map<dynamic, dynamic> json, tFromJson) {
    return ApiResponse<T>(
      status: json['status'],
      copyright: json['copyright'],
      section: json['section'],
      last_updated: json['last_updated'],
      numResults: json['num_results'],
      results: tFromJson(json['results']),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is ApiResponse) {
      return other.status == status &&
              other.copyright == copyright &&
              other.section == section &&
              other.last_updated == last_updated &&
              other.numResults == numResults &&
              other.results is List
          ? listEquals(other.results, results as List)
          : other.results == results;
    }

    return false;
  }
}

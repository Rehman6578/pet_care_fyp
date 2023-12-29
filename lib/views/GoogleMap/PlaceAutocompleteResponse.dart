import 'dart:convert';

import 'package:pet_care_fyp/views/GoogleMap/AutoCompletePrediction.dart';

class PlaceAutoCompleteResponse {
  final String? status;
  final List<AutoCompletePrediction>? predictions;

  PlaceAutoCompleteResponse({this.predictions, this.status});

  factory PlaceAutoCompleteResponse.fromJson(Map<String, dynamic> json) {
    return PlaceAutoCompleteResponse(
      predictions: json['predictions'] != null
          ? (json['predictions'] as List)
              .map((i) => AutoCompletePrediction.fromJson(i))
              .toList()
          : null,
      status: json['status'] as String?,
    );
  }

  static PlaceAutoCompleteResponse placeAutoCompleteResponse(String response) {

    final parsed = json.decode(response).cast<Map<String, dynamic>>();

    return PlaceAutoCompleteResponse.fromJson(parsed);

  }
}

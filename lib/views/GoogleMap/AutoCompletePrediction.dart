
class AutoCompletePrediction{

  late final String? description;

  final StructuredFormatting  structuredFormatting;

late final String? placeId;
late final String? reference;

  AutoCompletePrediction({this.description, this.placeId,
    required this.structuredFormatting,
    this.reference});

 factory AutoCompletePrediction.fromJson(Map<String, dynamic> json, ){
    return AutoCompletePrediction(
      description: json['description'] as String?,
      placeId: json['place_id'] as  String?,
      reference: json['reference'] as String?,
      structuredFormatting: json['structured_formatting'] != null ?
        StructuredFormatting.fromJson(json['structured_formatting'])
      : StructuredFormatting(),


    );
  }



}

class StructuredFormatting {

  late final String? mainText;
  late final String? secondaryText;


  StructuredFormatting({this.mainText, this.secondaryText});


  factory StructuredFormatting.fromJson(Map<String, dynamic> json){
    return StructuredFormatting(
      mainText: json['main_text'] as String?,
      secondaryText: json['secondary_text'] as String?,
    );
  }


}
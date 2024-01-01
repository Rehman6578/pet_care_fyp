
import 'package:dio/dio.dart';

class DirectionRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';
  final Dio _dio;
  DirectionRepository({required Dio dio}) : _dio = dio ?? Dio();

  // Future<Directions> getDirectionResponse(
  //     LatLng origin, LatLng destination) async {
  //   try {
  //     final response = await _dio.get(
  //       _baseUrl +
  //           'origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=${Constants.API_KEY}',
  //     );
  //     if (response.statusCode == 200) {
  //       return DirectionRepository.fromJson(response.data);
  //     }
  //     return DirectionResponse();
  //   } catch (e) {
  //     return DirectionResponse();
  //   }
  // }
}

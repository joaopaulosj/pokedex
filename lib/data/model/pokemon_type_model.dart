import 'package:pokedex/domain/entities/name_url_response.dart';

class NameUrlResponseModel extends NameUrlResponse {
  const NameUrlResponseModel({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory NameUrlResponseModel.fromJson(Map<String, dynamic> json) {
    return NameUrlResponseModel(
      name: json['name'],
      url: json['url'],
    );
  }
}

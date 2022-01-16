import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String url;
  final double? height;
  final double? weight;

  const Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.url,
    this.height,
    this.weight,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, url, height, weight];
}

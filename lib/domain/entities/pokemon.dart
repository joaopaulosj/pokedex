import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String? url;

  const Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.url,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, url];
}

import 'package:equatable/equatable.dart';

class NameUrlResponse extends Equatable {
  final String name;
  final String url;

  const NameUrlResponse({
    required this.name,
    required this.url,
  });

  @override
  List<Object> get props => [name, url];
}

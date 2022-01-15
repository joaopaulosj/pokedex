class ResultsModel<T> {
  final int count;
  final String? next;
  final String? previous;
  final List<T>? results;

  const ResultsModel({
    required this.count,
    this.next,
    this.previous,
    this.results = const [],
  });
}
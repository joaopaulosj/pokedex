class StringUtils {
  static int getIdFromUrl(String? url) {
    final urlParts = url?.split('/') ?? [];
    final id = int.parse(urlParts[urlParts.length - 2]);
    return id;
  }
}

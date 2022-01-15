class StringUtils {
  static int getIdFromUrl(String? url) {
    final urlParts = url?.split('/') ?? [];
    return int.parse(urlParts[urlParts.length - 2]);
  }
}

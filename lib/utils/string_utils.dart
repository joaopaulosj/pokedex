class StringUtils {
  static int getIdFromUrl(String? url) {
    final urlParts = url?.split('/') ?? [];
    final id = int.parse(urlParts[urlParts.length - 2]);
    return id;
  }

  static String capitalize(String str) {
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }
}

class AppState {
  static String route = "HNL → LAX";
  static String message = "Welcome aboard!";
  static String remainingTime = "4:30";

  static void update({String? newRoute, String? newMessage, String? newTime}) {
    if (newRoute != null) route = newRoute;
    if (newMessage != null) message = newMessage;
    if (newTime != null) remainingTime = newTime;
  }
}
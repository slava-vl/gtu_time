import 'package:go_router/go_router.dart';

extension GoRouterExt on GoRouter {
  String get _currentRoute => routerDelegate.currentConfiguration.matches.last.matchedLocation;

  /// Pop until the route with the given [path] is reached.
  /// Example
  /// ``` dart
  ///  GoRouter.of(context).popUntil(SettingsScreen.route);
  /// ```
  void popUntil<T extends Object?>(String path, [T? result]) {
    var currentRoute = _currentRoute;
    while (currentRoute != path && canPop()) {
      pop(result);
      currentRoute = _currentRoute;
    }
  }

  /// Pop until the route with the given [popUntilPath] is reached and push to [pushLocation].
  /// Example
  /// ``` dart
  ///  GoRouter.of(context).popUntil(SettingsScreen.route);
  /// ```
  void popUntilAndPush(String popUntilPath, String pushLocation, {Object? extra}) {
    var currentRoute = _currentRoute;
    while (currentRoute != popUntilPath && canPop()) {
      pop();
      currentRoute = _currentRoute;
    }
    push(pushLocation, extra: extra);
  }
}

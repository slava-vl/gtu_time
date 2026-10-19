abstract interface class IInitialRouteService {
  Future<void> init();
  String? get initialRoute;
}

const _additionalRoutesKey = '/additional_routes/';

enum CommonRoutes {
  schedule(path: '${_additionalRoutesKey}schedule'),
  scheduleTarget(path: '${_additionalRoutesKey}schedule_target');

  final String path;
  const CommonRoutes({required this.path});
}

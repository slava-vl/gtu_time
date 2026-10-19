const _additionalRoutesKey = '/additional_routes/';

enum CommonRoutes {
  schedule(path: '${_additionalRoutesKey}schedule'),
  chooseGroup(path: '${_additionalRoutesKey}choose_group');

  final String path;
  const CommonRoutes({required this.path});
}

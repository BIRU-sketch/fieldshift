import 'dart:io';

import 'package:fieldshift_backend/src/app.dart';

Future<void> main() async {
  final port = int.tryParse(Platform.environment['PORT'] ?? '') ?? 8080;
  final server = await serveApp(port: port);
  stdout.writeln('FieldShift backend listening on ${server.address.host}:${server.port}');
}


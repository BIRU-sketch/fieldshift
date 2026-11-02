import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

Future<HttpServer> serveApp({int port = 8080}) {
  final router = Router()
    ..get('/health', (_) => Response.ok('{"status":"ok"}', headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType!,
    }))
    ..mount('/api/v1/', featureRouter.call);

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router.call);

  return shelf_io.serve(handler, InternetAddress.anyIPv4, port);
}

final featureRouter = Router()
  ..get('farm-locations', _notImplemented)
  ..get('historical-climate', _notImplemented)
  ..post('rotation-plans/compare', _notImplemented)
  ..post('climate-scenarios/simulate', _notImplemented)
  ..post('recommendations/explain', _notImplemented);

Response _notImplemented(Request request) => Response.notFound(
      '{"error":"Endpoint not implemented yet"}',
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.mimeType!},
    );


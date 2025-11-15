import 'package:segcdmx_app/app/app.dart';
import 'package:segcdmx_app/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}

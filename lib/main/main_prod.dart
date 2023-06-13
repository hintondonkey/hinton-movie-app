import 'package:movie_app/domain/provider/index.dart';

import 'app_entry.dart';

main() => AppEntry().runWithFlavor(flavor: EnvironmentFlavor.prod);

import 'package:flutter/cupertino.dart';
import 'Ressources.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}
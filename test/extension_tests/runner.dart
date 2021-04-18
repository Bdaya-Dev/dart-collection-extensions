import 'package:test/test.dart';
import '_base.dart';

import 'group_by.dart' as testGroupBy;
import 'map_many.dart' as testMapMany;

void main() {
  group('extensions test', () {
    testGroupBy.main();
    testMapMany.main();
  });
}

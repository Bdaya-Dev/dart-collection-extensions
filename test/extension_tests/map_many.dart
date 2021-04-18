import '_base.dart';

void main() {
  group('mapMany', () {
    test('empty', () {
      expect(
        prepareObjects(true).mapManyEx((item) => item.objects).toList(),
        [],
      );
    });
    test('multiple', () {
      final items = prepareObjects(false);
      expect(
        items.mapManyEx((item) => item.objects).toList(),
        [
          for (var x in items) ...x.objects,
        ],
      );
    });
  });
}

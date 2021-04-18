import '_base.dart';

void main() {
  group('groupByEx', () {
    test('empty', () {
      expect(
        prepareObjects(true).groupByEx((item) => item.testKey),
        <GroupedIterable<String, TestObjectRoot>>[],
      );
    });
    test('multiple', () {
      final items = prepareObjects(false).toList();
      expect(
        items.groupByEx((item) => item.testKey),
        <GroupedIterable<String, TestObjectRoot>>[
          GroupedIterable<String, TestObjectRoot>(
            'a',
            [
              items[0],
              items[1],
            ],
          ),
          GroupedIterable<String, TestObjectRoot>(
            'b',
            [
              items[2],
            ],
          ),
        ],
      );
    });
  });
}

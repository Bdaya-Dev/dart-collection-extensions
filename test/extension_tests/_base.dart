export 'package:collection_extensions/collection_extensions.dart';
export 'package:test/test.dart';

class TestObjectRoot {
  final String testKey;
  final List<TestObject1> objects;

  TestObjectRoot(this.testKey, this.objects);
}

class TestObject1 {
  final String testKey;

  TestObject1(this.testKey);
}

List<TestObjectRoot> prepareObjects(bool isEmpty) {
  if (isEmpty) return <TestObjectRoot>[];
  return <TestObjectRoot>[
    TestObjectRoot(
      'a',
      <TestObject1>[
        TestObject1('a1'),
        TestObject1('a2'),
        TestObject1('a3'),
      ],
    ),
    TestObjectRoot(
      'a',
      <TestObject1>[
        TestObject1('a4'),
        TestObject1('a5'),
        TestObject1('a6'),
      ],
    ),
    TestObjectRoot(
      'b',
      <TestObject1>[
        TestObject1('b1'),
        TestObject1('b2'),
        TestObject1('b3'),
      ],
    ),
  ];
}

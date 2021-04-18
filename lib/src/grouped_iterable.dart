library collection_extensions;

import 'package:collection/collection.dart';

///
class GroupedIterable<TKey, TVal> extends DelegatingIterable<TVal>
    implements Equality<GroupedIterable<TKey, TVal>> {
  final TKey key;

  GroupedIterable(
    this.key,
    Iterable<TVal> base,
  ) : super(base);

  @override
  int get hashCode => key.hashCode;

  @override
  bool equals(GroupedIterable<TKey, TVal> e1, GroupedIterable<TKey, TVal> e2) {
    return e1.key == e2.key;
  }

  @override
  int hash(GroupedIterable<TKey, TVal> e) {
    return e.key.hashCode;
  }

  @override
  bool isValidKey(Object? o) {
    return o is GroupedIterable;
  }
}

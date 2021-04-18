import 'package:collection/collection.dart';

import 'grouped_iterable.dart';

extension ExtraIterableExtensions<T> on Iterable<T> {
  /// a better version of groupBy that can be chained easily for multi-level groups
  Iterable<GroupedIterable<TKey, T>> groupByEx<TKey>(
    TKey keySelector(T item),
  ) {
    final res = <TKey, List<T>>{};
    for (var item in this) {
      (res[keySelector(item)] ??= <T>[]).add(item);
    }
    return res.entries.map((e) => GroupedIterable(e.key, e.value));
  }

  /// Equivalent to C#'s SelectMany, iterates over multiple iterables
  Iterable<TVal> mapManyEx<TVal>(
    Iterable<TVal> selector(T item),
  ) sync* {
    for (var item in this) {
      if (item == null) continue;
      yield* selector(item);
    }
  }

  /// Sums all the values in a list based on the selector
  num sumEx(
    num selector(T item),
  ) {
    num res = 0;
    for (var item in this) {
      res += selector(item);
    }
    return res;
  }

  /// calculates the average of a list based on a selector
  /// returns 0 if empty
  num averageEx(
    num selector(T item), {
    num resultIfEmpty = 0,
  }) {
    if (length == 0) return resultIfEmpty;
    return this.sumEx(selector) / length;
  }

  /// [maxBy] as an extension method
  T? maxByEx<TKey>(
    TKey orderBy(T? item), {
    int Function(TKey, TKey)? compare,
  }) =>
      maxBy<T, TKey>(
        this,
        orderBy,
        //TODO: change this after fixing https://github.com/dart-lang/collection/issues/188
        compare: compare == null ? null : (t1, t2) => compare(t1, t2),
      );

  /// [maxBy] as an extension method
  T? minByEx<TKey>(
    TKey orderBy(T? item), {
    int Function(TKey, TKey)? compare,
  }) =>
      minBy<T, TKey>(
        this,
        orderBy,
        compare: compare,
      );
}

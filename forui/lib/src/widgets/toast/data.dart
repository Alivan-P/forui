import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// A mixin that provides a [shouldNotify] method to determine if the data has
/// changed and should notify the listeners.
mixin DistinctData {
  /// Returns true if the data has changed and should notify the listeners.
  bool shouldNotify(covariant DistinctData oldData);
}

class InheritedData<T> extends InheritedWidget {
  final T? data;

  Type get dataType => T;

  const InheritedData._internal({super.key, required this.data, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedData<T> oldWidget) => oldWidget.data != data;
}

/// A widget that provides the data to its descendants.
class Data<T> extends StatelessWidget {
  final T? _data;

  /// The child widget.
  final Widget? child;

  /// Creates a Data for MultiData.
  const Data(T data, {super.key}) : _data = data, child = null, super();

  /// Creates a single Data widget.
  const Data.inherit({super.key, required T data, this.child}) : _data = data;

  /// The data that will be provided to the descendants.
  T get data {
    assert(_data != null, 'No Data<$T> found in context');
    return _data!;
  }

  @override
  Widget build(BuildContext context) {
    assert(dataType != dynamic, 'Data must have a type');
    return InheritedData<T>._internal(data: _data, child: child ?? const SizedBox());
  }

  /// {@template Data.maybeOf}
  /// Optionally find and listen to data changes of the data with the given type from the context.
  ///
  /// * [T] The type of the data.
  /// * [context] The build context.
  /// {@endtemplate}
  static T? maybeOf<T>(BuildContext context) {
    assert(context.mounted, 'The context must be mounted');
    final widget = context.dependOnInheritedWidgetOfExactType<InheritedData<T>>();
    if (widget == null) {
      return null;
    }
    return widget.data;
  }

  /// Capture all the data from another context.
  ///
  /// * [context] The context to capture the data.
  /// * [to] The context to stop capturing the data.
  static List<InheritedData> capture({required BuildContext from, required BuildContext? to}) {
    if (from == to) {
      return [];
    }
    final data = <InheritedData>[];
    final Set<Type> dataTypes = <Type>{};
    late bool debugDidFindAncestor;
    assert(() {
      debugDidFindAncestor = to == null;
      return true;
    }());

    from.visitAncestorElements((ancestor) {
      if (ancestor == to) {
        assert(() {
          debugDidFindAncestor = true;
          return true;
        }());
        return false;
      }
      if (ancestor is InheritedElement && ancestor.widget is InheritedData) {
        final InheritedData dataWidget = ancestor.widget as InheritedData;
        final Type dataType = dataWidget.dataType;
        if (!dataTypes.contains(dataType)) {
          dataTypes.add(dataType);
          data.add(dataWidget);
        }
      }
      return true;
    });

    assert(debugDidFindAncestor, 'The provided `to` context must be an ancestor of the `from` context.');

    return data;
  }

  Type get dataType => T;
}

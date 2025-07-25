// dart format off
// coverage:ignore-file


// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class FLocalizationsUz extends FLocalizations {
  FLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String fullDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String year(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.y(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String yearMonth(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMM(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String abbreviatedMonth(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.MMM(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String day(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.d(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String shortDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String get barrierLabel => 'Kanop';

  @override
  String barrierOnTapHint(String modalRouteContentName) {
    return 'Yopish: \$modalRouteContentName';
  }

  @override
  String get dateFieldHint => 'Sanani tanlang';

  @override
  String get dateFieldInvalidDateError => 'Sana yaroqsiz.';

  @override
  String get shortDateSeparator => '/';

  @override
  String get shortDateSuffix => '';

  @override
  String get dialogSemanticsLabel => 'Muloqot oynasi';

  @override
  String get paginationPreviousSemanticsLabel => 'Oldingi';

  @override
  String get paginationNextSemanticsLabel => 'Keyingi';

  @override
  String get popoverSemanticsLabel => 'Popover';

  @override
  String get selectHint => 'Element tanlang';

  @override
  String get selectSearchHint => 'Qidirish';

  @override
  String get selectNoResults => 'Mos keladigan natijalar yo\'q.';

  @override
  String get selectScrollUpSemanticsLabel => 'Tepaga aylantirish';

  @override
  String get selectScrollDownSemanticsLabel => 'Pastga aylantirish';

  @override
  String get sheetSemanticsLabel => 'ekran';

  @override
  String get textFieldClearButtonSemanticsLabel => 'Tozalash';

  @override
  String get timeFieldTimeSeparator => ':';

  @override
  String get timeFieldPeriodSeparator => '';

  @override
  String get timeFieldSuffix => '';

  @override
  String get timeFieldHint => 'Vaqtni tanlang';

  @override
  String get timeFieldInvalidDateError => 'Yaroqsiz vaqt.';
}

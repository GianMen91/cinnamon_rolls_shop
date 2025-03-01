// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/src/screens/cart_screen.dart' as _i2;
import 'package:widgetbook_workspace/src/screens/item_screen.dart' as _i3;
import 'package:widgetbook_workspace/src/screens/shop_screen.dart' as _i4;
import 'package:widgetbook_workspace/src/screens/splash_screen.dart' as _i5;
import 'package:widgetbook_workspace/src/widgets/build_icon_button.dart' as _i6;
import 'package:widgetbook_workspace/src/widgets/cart_counter.dart' as _i7;
import 'package:widgetbook_workspace/src/widgets/item_card.dart' as _i8;
import 'package:widgetbook_workspace/src/widgets/search_box.dart' as _i9;
import 'package:widgetbook_workspace/src/widgets/type_selector.dart' as _i10;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'screens',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'CartScreen',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i2.buildCartScreenUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ItemScreen',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i3.builditemScreenUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ShopScreen',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i4.buildShopScreenUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'SplashScreen',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i5.buildSplashScreenUseCase,
        ),
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'BuildIconButton',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i6.buildBuildIconButtonUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'CartCounter',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i7.buildCartCounterUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ItemCard',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i8.buildItemCardUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'SearchBox',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i9.buildSearchBoxUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'TypeSelector',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i10.buildTypeSelectorUseCase,
        ),
      ),
    ],
  ),
];

// Copyright (C) 2013 - 2014 Angular Dart UI authors. Please see AUTHORS.md.
// https://github.com/akserg/angular.dart.ui
// All rights reserved.  Please see the LICENSE.md file.
library angular.ui.demo;

//import 'dart:html' as dom;
//import 'dart:math' as math;
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular_ui/angular_ui.dart';
import 'package:ang/combo-box.dart';
//import 'package:angular_ui/utils/utils.dart';

//import 'package:angular_ui/dragdrop/dragdrop.dart';

import 'ui-test.dart';

/**
 * Entry point into app.
 */
main() {
  applicationFactory()
    .addModule(new DemoModule())
    .run();
}

/**
 * Demo Module
 */
class DemoModule extends Module {
  DemoModule() {
    install(new AngularUIModule());
    bind(SortableController);
    bind(Product);
    bind(ComboBox1);
    //
//    bind(DragDropShoppingBasketDemoController);
//    bind(DragDropListDemoController);
//    bind(DragDropCustomImageDemoController);
//    bind(DragDropHandlerDemoController);
//    bind(TypeaheadDemoController);
  }
}
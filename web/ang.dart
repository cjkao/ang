
import 'package:angular/application_factory.dart';
import 'package:angular/angular.dart';
import 'package:ang/comp/sample.dart';
import 'dart:html';
main() {
  var injector=applicationFactory()
      .addModule(new MyAppModule())
      .run();
}



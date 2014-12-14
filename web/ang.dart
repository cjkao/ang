
import 'package:angular/application_factory.dart';
import 'package:angular/angular.dart';
import 'package:ang/comp/RecipeGrid.dart';
import 'dart:html';
import 'dart:async';
main() async{
  var z=await bar();
  var ret=await HttpRequest.getString('main.html');
  print(ret);
//  print('!!!!!$z');
  var injector=applicationFactory()
      .addModule(new MyAppModule())
      .run();
  print("hi");
}


foo () async => 42;
bar () async { return await foo() ~/ 2; }

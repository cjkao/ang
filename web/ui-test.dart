// Copyright (C) 2013 - 2014 Angular Dart UI authors. Please see AUTHORS.md.
// https://github.com/akserg/angular.dart.ui
// All rights reserved.  Please see the LICENSE.md file.
import 'package:angular_ui/angular_ui.dart';
import 'dart:html';
import 'package:angular/angular.dart';
@Component(
    selector: 'prod-item',
    template: '''
<div>
<div>{{name}}...</div>
<div draggable="false">big body</div>
</div>
'''
)
class Product {

  int quantity;
  int cost;
  @NgOneWay('spec')
  String name;

  Product();

}


@Component(
    selector: '[sortable-simple-controller]',
    templateUrl: 'packages/ang/dragdrop_demo.html',
    useShadowDom: false
    )
class SortableController {

  List<String> listSrc = ['Coffee','Orange Juice','Red Wine','Unhealty drink!','Water'];
  List<Product> listOne = [];

  SortableController() {
//       listOne=listSrc.map((_)=>  new Product(_, 1, 100)).toList();
  }

}






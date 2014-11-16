import 'package:angular/angular.dart';
import 'package:slickdart/slick_custom.dart';
import 'dart:html';
import 'cust.dart';

@Component(
    cssUrl: const ['ang.css','bootstrap.css'],
    selector: 'recipe-book',
    template: '''<h1> this is angular example, click box</h1>
                <cj-grid ng-click='loadData(\$event)'></cj-grid>
                <input ng-if='rowCount>0' ng-click="changeData(\$event)" type='button' value='change'> <h3> total: {{rowCount}}</h3>
                <br>
                <h3>Selected rows:</h3>
                <div class='right-pane'></div>
'''    )
class RecipeComp extends AttachAware with ScopeAware, ShadowRootAware{
  ShadowRoot shadow;
  int rowCount=0;
  JGrid gw0;
  List data;
  void attach(){  }
  void onShadowRoot(ShadowRoot shadowRoot){
    this.shadow=shadowRoot;
  }
  void loadData($event){
    if(gw0==null){
      gw0 = shadow.querySelector("$GRID_TAG");
      data=getData();
      gw0.init(data,getColDefs());
      rowCount=data.length;
      gw0.setData(data);

      gw0.grid.onSelectedRowsChanged.subscribe((e, Map args) {
        shadow.querySelector('.right-pane')
                ..children.clear()
                ..appendText((args['rows'] as List).join(' '));
       });

    }
  }

  void changeData($event){

    data=getData();
    rowCount=data.length;
    gw0.setData(data);
  }


  bool hide=true;
  Scope scope;
  void handleClick($event){
    print($event);
  }
  void handlePress($event){
      print($event);
  }


}

class MyAppModule extends Module {
  MyAppModule() {
    registerElem();
    bind(RecipeComp);
  }
}


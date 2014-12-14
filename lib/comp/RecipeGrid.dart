import 'package:angular/angular.dart';
import 'package:slickdart/slick_custom.dart';
import 'dart:html';
import 'cust.dart';
import 'dnd.dart';
@Component(
    cssUrl: const ['ang.css','bootstrap.css'],
    //useShadowDom: false,
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



@Component(
    useShadowDom: false,
    selector: 'recipe-book-light',
    template: '''<h1> this is Light Dom, click box</h1>
                <cj-grid class='light' ng-click='loadData(\$event)'></cj-grid>
                <input ng-if='rowCount>0' ng-click="changeData(\$event)" type='button' value='change'> <h3> total: {{rowCount}}</h3>
                <br>
                
'''    )
class RecipeCompLight extends AttachAware with ScopeAware{
  int rowCount=0;
  JGrid gw0;
  List data;
  void attach(){
    print('attached');
  }

  void loadData($event){
    if(gw0==null){
      gw0 = querySelector("$GRID_TAG.light");
      data=getData();
      gw0.init(data,getColDefs());
      rowCount=data.length;
      gw0.setData(data);
     }
  }
  void changeData($event){
    data=getData();
    rowCount=data.length;
    gw0.setData(data);
  }
  bool hide=true;
  Scope _scope;
  void set scope(Scope scope){
    this._scope=scope;
    print('in scope');
  }
}






class MyAppModule extends Module {
  MyAppModule() {
    registerElem();
    bind(RecipeComp);
    bind(RecipeCompLight);
    bind(Book);
    bind(Card);
  }
}


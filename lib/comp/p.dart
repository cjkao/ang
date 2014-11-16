import 'package:angular/angular.dart';
import 'dart:html';
import 'dart:async';
@Injectable()
class AppComponent{
  NodeValidator validator;
  Compiler _compiler;
  DirectiveInjector _directiveInjector;
  DirectiveMap _directiveMap;
  NodeTreeSanitizer _nodeTreeSanitizer;
  Injector _appInjector;
  Scope _scope;

  AppComponent(this._directiveInjector, this._compiler, this._directiveMap, this._nodeTreeSanitizer, this._appInjector, this._scope) {
    validator = new NodeValidatorBuilder.common()
                          ..allowCustomElement("BRAZOS-INPUT-STRING")
                          ..allowHtml5()

                          ..allowTemplating();
  }

  void addElement(String id, String elementHTML) {
    DivElement container = querySelector(id);
    DivElement inner = new DivElement();
    container.append(inner);
    Element element = new Element.html(elementHTML, validator: validator);
    ViewFactory viewFactory = _compiler.call([element], _directiveMap);
    if (_scope != null) {
      Scope childScope = _scope.createProtoChild();
      View newView = viewFactory.call(childScope, _directiveInjector);
      newView.nodes.forEach((node) => inner.append(node));
      Timer.run(() => childScope.apply());
    } else {
      print("scope is null");
    }
  }
}


@Component(
    selector: 'recipe-book',
    templateUrl: 'packages/ang/comp/p.html'    )
class RecipeComp implements ScopeAware{
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
    bind(RecipeComp);
    bind(AppComponent);
  }
}
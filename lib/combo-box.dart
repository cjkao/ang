import 'package:angular_ui/angular_ui.dart';
import 'package:angular/angular.dart';
import 'dart:html' as dom;
@Component(
  selector: 'combo-box-1',
  template: r'''
    <pre ng-click='change()'>Model: {{selected | json}}</pre>
    <form>
    <input ng-hide='hideFilter' type="text" ng-model="selected" typeahead="state for state in states | filter:$viewValue"
           class="form-control"  typeahead-editable='true' typeahead-min-length='6' class='hide'
            required>
    </form>
''',
//  useShadowDom: false,
  cssUrl: const ['combo-box.css','bootstrap.css'],
  exportExpressions: const ["states", 'hideFilter', r"$viewValue", "state",'change', "popupId", "activeIdx"]
)
class ComboBox1 extends ScopeAware with ShadowRootAware {
  dom.ShadowRoot _shadowRoot;
  Scope scope;
  void onShadowRoot(dom.ShadowRoot shadowRoot){
    _shadowRoot=shadowRoot;
  }
//  var _selected='';
//  get selected => _selected;
//  set selected(val) {
//    selected='a' +val;
//  }
  bool hideFilter=true;
  var selected;
  var states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Dakota', 'North Carolina', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'];
  dom.Element elem;
  ComboBox1(this.elem);
  change(){
    hideFilter=false;
   //print( dom.document.querySelector('input'));
   dom.InputElement input=_shadowRoot.querySelector('input');
   input.classes.remove('hide');
   print('changed');
   input.dispatchEvent(new dom.Event('change'));
   input.focus();

  }
}